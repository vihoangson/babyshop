<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends Admin {

	public function __construct(){
		parent::__construct();
	}

	public function index()
	{
		//redirect('/admin/product/input','refresh');
		$rs = $this->products_model->with_product_images()->get_all();
		$this->twig->display("admin/product/index",compact("rs"));
	}

	public function input($id=null){
		if($_REQUEST || $_FILES){

			$options=[];
			if($this->input->post('name')){
				$options["name"] = $this->input->post('name');
			}
			if($this->input->post('description')){
				$options["description"] = $this->input->post('description');
			}
			if($this->input->post('category')){
				$options["category"] = $this->input->post('category');
			}
			if($this->input->post('price')){
				$options["price"] = $this->input->post('price');
			}
			if($this->input->post('active')){
				$options["active"] = $this->input->post('active');
			}
			if($this->input->post('special_content')){
				$options["special_content"] = $this->input->post('special_content');
			}
			if($this->input->post('special_price')){
				$options["special_price"] = $this->input->post('special_price');
			}
			if($this->input->post('views')){
				$options["views"] = $this->input->post('views');
			}
			// if($image_name){
			// 	$options["image"] = $image_name;
			// }

			if($options){
				if(!$id){
						if($id = $this->products_model->insert($options)){
							$this->session->set_flashdata('alert_success', 'Đã lưu thành công');
						}else{
							$this->session->set_flashdata('alert_error', 'Gặp lỗi');
						}
				}else{
					$this->products_model->where(["id"=>$id]);
					if($this->products_model->update($options)){
						$this->session->set_flashdata('alert_success', 'Đã lưu thành công');
					}else{
						$this->session->set_flashdata('alert_error', 'Gặp lỗi');
					}
				}
			}

			//============ ============ ============  ============  ============  ============ 
			//
			if($_FILES["image"]){
				//============  ============ 
				// upload img
				// Output: $image_name
				//
				$config['upload_path'] = FCPATH.'assets/uploads/';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size']  = '100000';
				$config['max_width']  = '10000';
				$config['max_height']  = '10000';
				$this->load->library('upload', $config);
				$this->load->library('my_resize');				
				if(is_array($_FILES["image"]["name"])){
					$files = $_FILES["image"];
					$_FILES["image"]=[];
					foreach ($files["name"] as $key => $value) {
						$_FILES["image"]['name']     = $files["name"][$key];
						$_FILES["image"]['type']     = $files["type"][$key];
						$_FILES["image"]['size']     = $files["size"][$key];
						$_FILES["image"]['tmp_name'] = $files["tmp_name"][$key];
						$_FILES["image"]['error']    = $files["error"][$key];

						if ( ! $this->upload->do_upload("image")){
							$error = array('error' => $this->upload->display_errors());
							dd($error);
						}else{
							$data = array('upload_data' => $this->upload->data());
							// Resize img 600x600
							$this->my_resize->resize($data["upload_data"]["full_path"],600,600);
							// End resize
							$fullpath = $data["upload_data"]["file_path"].$data["upload_data"]["file_name"];
							$image_name[] = preg_replace("/(.+)\/assets/", "/assets", $fullpath);
						}
					}
				}else{
						if ( ! $this->upload->do_upload("image")){
							$error = array('error' => $this->upload->display_errors());
						}
						else{
							$data = array('upload_data' => $this->upload->data());
							// Resize img 600x600
							$this->my_resize->resize($data["upload_data"]["full_path"],600,600);
							// End resize
							$fullpath = $data["upload_data"]["file_path"].$data["upload_data"]["file_name"];
							$image_name = preg_replace("/(.+)\/assets/", "/assets", $fullpath);
						}
					
				}
				//
				//============  ============ 
			}			
			if($image_name){
				$this->load->model('product_images_model');
				foreach ($image_name as $key => $value) {
					$params = [
								"product_id" => $id,
								"path_img"   => $value,
							];
					$this->product_images_model->insert($params);
				}
			}
			redirect('/admin/product','refresh');
		}
		if($id){
			$rs = $this->products_model->with_product_images()->get($id);
		}
		$this->twig->display("admin/product/input",compact("rs"));
	}

	public function delete($id){
		$product = $this->products_model->get($id);
		if($product->image){
			$product->image = FCPATH.ltrim($product->image,"/");
			unlink($product->image);
		}
		if($this->products_model->delete($id)){
			$this->session->set_flashdata('alert_success', 'Đã xóa thành công');
		}else{
			$this->session->set_flashdata('alert_error', 'Không xóa được');
		}
		redirect('/admin/product','refresh');
	}
}

/* End of file Product.php */
/* Location: ./application/controllers/admin/Product.php */