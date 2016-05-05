<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ajax_products extends Admin {


	public function delete_img(){
		$id = (int)$this->input->post('id');
		$this->load->model('product_images_model');
		$product_images = $this->product_images_model->get($id);
		if($product_images->path_img){
			$product_images->path_img = FCPATH.ltrim($product_images->path_img,"/");
			@unlink($product_images->path_img);
		}
		if($this->product_images_model->delete($id)){
			echo json_encode(["status"=>"done"]);
		}else{
			echo json_encode(["status"=>"error"]);
		}
		die;
	}
}

/* End of file Ajax_products.php */
/* Location: ./application/controllers/ajax/Ajax_products.php */