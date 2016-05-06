<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Import extends Admin {

	public function __construct(){
		parent::__construct();
		$this->load->model('product_images_model');
		// /admin/import/product
	}

	public function product()
	{
		if($_FILES){
			$path = FCPATH.'assets/import_file/';
			if(!is_dir($path)){
				mkdir($path);
			}
			$config['upload_path'] = $path;
			$config['allowed_types'] = 'xlsx';
			$this->load->library('upload', $config);
			if ( ! $this->upload->do_upload()){
				$error = array('error' => $this->upload->display_errors());
				$this->session->set_flashdata('alert_error', "Không lưu được file");
				redirect('/admin/import/product','refresh');
			}
			else{
				$data = array('upload_data' => $this->upload->data());
			}
			$this->db->query('truncate table products');
			$this->db->query('truncate table product_images');
			$db_import = $this->get_data($path.$data["upload_data"]["file_name"]);		
			foreach ($db_import as $key => $value) {
				foreach (["id","name","description","category","price","image","active","special_price"] as $key_t => $value_t) {
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
			redirect('/admin/import/product','refresh');
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