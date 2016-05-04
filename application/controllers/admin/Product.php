<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends Admin {

	public function index()
	{

		dd($this->products_model->get_all());
	}

	public function create(){
		$options = [
			"name" => "name123",
			"description" => "123",
			"category" => 1,
			"price" => "100000",
			"image" => "/asset/upload/img.jpg",
			"active" => 1,
			"special_content" => "",
			"special_price" => "",
			"views" => 0,
		];
		$this->products_model->insert($options);
	}

}

/* End of file Product.php */
/* Location: ./application/controllers/admin/Product.php */