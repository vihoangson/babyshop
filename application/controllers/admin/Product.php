<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends Admin {

	public function index()
	{
		redirect('/admin/product/input','refresh');
		dd($this->products_model->get_all());
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
			if($this->products_model->insert($options)){
				$this->session->set_flashdata('alert_success', 'Đã lưu thành công');
			}else{
				$this->session->set_flashdata('alert_error', 'Gặp lỗi');
			}
			redirect('/admin/product','refresh');
		}
		$rs = $this->products_model->get($id);
		$this->twig->display("admin/product/input",compact("rs"));
	}


}

/* End of file Product.php */
/* Location: ./application/controllers/admin/Product.php */