<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends Admin {

	public function index()
	{
		//redirect('/admin/product/input','refresh');
		$rs = $this->products_model->get_all();
		$this->twig->display("admin/product/index",compact("rs"));
	}

	public function input($id=null){
		if($this->input->post()){
			$options = [
				"name"            => $this->input->post('name'),
				"description"     => $this->input->post('description'),
				"category"        => $this->input->post('category'),
				"price"           => $this->input->post('price'),
				"image"           => $this->input->post('image'),
				"active"          => $this->input->post('active'),
				"special_content" => $this->input->post('special_content'),
				"special_price"   => $this->input->post('special_price'),
				"views"           => $this->input->post('views'),
			];
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