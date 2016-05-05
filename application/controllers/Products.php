<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends Frontend {

	public function index()
	{
		$rs = $this->products_model->with_product_images()->get_all();
		$this->twig->display("products/index",compact("rs"));
	}

}

/* End of file Products.php */
/* Location: ./application/controllers/Products.php */