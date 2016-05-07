<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Import extends Admin {

	private $array_title_table_product;

	public function __construct(){
		parent::__construct();
		$this->load->model('product_images_model');
		$this->array_title_table_product = ["id","name","description","category","price","image","active","special_price"];
	}

	public function install_category(){
		if($this->_install_category()){
			$this->session->set_flashdata('alert_success',"Đã install");
		}else{
			$this->session->set_flashdata('alert_error',"Gặp lỗi");
		}
		redirect('/admin/import/do_import','refresh');
	}

	/**
	 * private function _install_category
	 *
	 * Function này dùng để instal default category
	 * 
	 * @return void
	 * @author Santo
	 **/
	private function _install_category(){
		$this->load->model('categories');
		$this->db->query('truncate table categories');
		$json_string = '
		{
			"Man":
				{"1":"Shirts","2":"T-shirts","3":"Shoes"},
			"Woman":
				{"1":"Dresses","2":"Bags","3":"Rings"},
			"Smartphones":
				{"1":"Apple iPhone","2":"Samsung Galaxy","3":"Sony Xperia"},
			"Tablets":
				{"1":"Apple iPad","2":"Samsung Tablet","3":"Lenevo Tablet"},
			"Laptop":
				{},
			"Desctop":
				{},
			"Watch":
				{}
		}';
		$variable = json_decode($json_string);
		foreach ($variable as $key => $value) {
			$params = [
				"name"      =>$key,
				"parent_id" => 0
			];
			$id = $this->categories->insert($params);
			foreach ($value as $key_v => $value_v) {
				$params = [
					"name"      =>$value_v,
					"parent_id" => $id
				];
				$this->categories->insert($params);
			}
		}
		return true;
	}

	public function do_export()
	{
		
		$products = $this->products_model->with_product_images()->get_all();

		foreach ($this->array_title_table_product as $key_t => $value_t) {
			$array[0][]= $value_t;
		}
		// Add more column: path_img
		$array[0][]= "path_img";

		foreach ($products as $key => $value) {
			// $this->array_title_table_product all off element in table products
			foreach ($this->array_title_table_product as $key_t => $value_t) {
				$array[$key+1][$value_t]= $value->{$value_t};
			}

			// Content for column: path_img
			$array_img = [];
			foreach ($value->product_images as $key_im => $value_im) {
				$array_img[] = $value->product_images[$key_im]->path_img;
			}
			$array[$key+1]["path_img"]= implode(",", $array_img);

		}
		$this->_build_file_excel($array);
	}
	private function _build_file_excel($array){
		$doc = new PHPExcel();
		$doc->setActiveSheetIndex(0);

		$doc->getActiveSheet()->fromArray($array, null, 'A1');
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="your_name.xls"');
		header('Cache-Control: max-age=0');

		// Do your stuff here
		$writer = PHPExcel_IOFactory::createWriter($doc, 'Excel5');
		$writer->save('php://output');
	}

	public function do_import()
	{
		if($_FILES){
			$path = FCPATH.'assets/import_file/';
			if(!is_dir($path)){
				mkdir($path);
			}
			$config['upload_path'] = $path;
			$config['allowed_types'] = 'xlsx|xls';
			$this->load->library('upload', $config);
			if ( ! $this->upload->do_upload()){
				$error = array('error' => $this->upload->display_errors());
				$this->session->set_flashdata('alert_error', "Không lưu được file");
				redirect('/admin/import/do_import','refresh');
			}
			else{
				$data = array('upload_data' => $this->upload->data());
			}
			$this->db->query('truncate table products');
			$this->db->query('truncate table product_images');
			$db_import = $this->get_data($path.$data["upload_data"]["file_name"]);		
			foreach ($db_import as $key => $value) {
				foreach ($this->array_title_table_product as $key_t => $value_t) {
					$params[$value_t] = $value[$value_t];
				}
				$this->products_model->insert($params);
				$img_array = explode(",",$value["path_img"]);
				foreach ($img_array as $key_img => $value_img) {
					$params_img = [
						"product_id" => $value["id"],
						"path_img"   => $value_img,
					];
					$this->product_images_model->insert($params_img);
				}
			}
			$this->session->set_flashdata('alert_success', "Import thành công");
			redirect('/admin/import/do_import','refresh');
		}

		$this->twig->display("admin/input_import");
	}

	private function get_data($path_file){
		$objReader = PHPExcel_IOFactory::load($path_file);
		$array_excel = $objReader->getActiveSheet()->toArray();
		$keys = $array_excel[0];
		unset($array_excel[0]);
		foreach ($array_excel as $key => $value) {
			if($value[0]){
				foreach ($keys as $key1 => $value1) {
					$return[$key][$value1] = $value[$key1];
				}
			}
		}
		return $return;
	}

}

/* End of file Import.php */
/* Location: ./application/controllers/admin/Import.php */