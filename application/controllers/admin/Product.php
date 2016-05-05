<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends Admin {

	public function __construct(){
		parent::__construct();
	}

	public function index()
	{
		//redirect('/admin/product/input','refresh');
		$rs = $this->products_model->get_all();
		$this->twig->display("admin/product/index",compact("rs"));
	}

	public function input($id=null){
		if($this->input->post()){
			$config['upload_path'] = FCPATH.'assets/uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$config['max_size']  = '100000';
			$config['max_width']  = '10000';
			$config['max_height']  = '10000';
			
			$this->load->library('upload', $config);
			
			if ( ! $this->upload->do_upload("image")){
				$error = array('error' => $this->upload->display_errors());
			}
			else{
				$data = array('upload_data' => $this->upload->data());
				$this->load->library('my_resize');
				$this->my_resize->resize($data["upload_data"]["full_path"],600,600);
				$fullpath = $data["upload_data"]["file_path"].$data["upload_data"]["file_name"];
				$image_name = preg_replace("/(.+)\/assets/", "/assets", $fullpath);
			}

			$options = [
				"name"            => $this->input->post('name'),
				"description"     => $this->input->post('description'),
				"category"        => $this->input->post('category'),
				"price"           => $this->input->post('price'),
				"active"          => $this->input->post('active'),
				"special_content" => $this->input->post('special_content'),
				"special_price"   => $this->input->post('special_price'),
				"views"           => $this->input->post('views'),
			];
			if($image_name){
				$options["image"] = $image_name;
			}
			if(!$id){
				if($this->products_model->insert($options)){
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
			redirect('/admin/product','refresh');
		}
		if($id){
			$rs = $this->products_model->get($id);
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