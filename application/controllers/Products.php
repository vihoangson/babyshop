<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends Frontend {

	public function index()
	{
		
		if($this->input->get('perpage')){
			$array = array(
				'perpage' => $this->input->get('perpage')
			);
			$this->session->set_userdata( $array );
		}
		if($this->input->get('sorttype')){
			$array = array(
				'sorttype' =>$this->input->get('sorttype')
			);
			$this->session->set_userdata( $array );
		}

		// Sort type
		$this->_set_order($this->products_model);

		// Set perpage
		if($this->session->userdata('perpage')){
			$perpage= $this->session->userdata('perpage');
		}else{
			$perpage= 3;
		}

		$this->products_model->pagination_delimiters = ["<li>","</li>"];
		
		$total_posts     = $this->products_model->count_rows(); // retrieve the total number of posts
		$rs              = $this->products_model->with_product_images()->paginate($perpage,$total_posts); // paginate with 10 rows per page
		$number_of_pages = ceil($total_posts / $perpage);
		if($number_of_pages>1){
			$pagination = '<ul class="pagination">'.$this->products_model->all_pages.'</ul>'; // will output links to all pages like this model: "< 1 2 3 4 5 >". It will put a link if the page number is not the "current page"
		}else{
			$pagination ="";
		}
		$this->twig->display("products/index",compact("rs","pagination"));

	}

	private function _set_order(&$modal){
		if($this->session->userdata('sorttype')){
			$sorttype = explode(":",$this->session->userdata('sorttype'));
			$modal->order_by($sorttype[0],$sorttype[1]);
		}
	}

	private function _set_perpage(&$modal){
		if($this->session->userdata('perpage')){
			$perpage = $this->session->userdata('perpage');
			$modal->limit($perpage);
		}
	}
}

/* End of file Products.php */
/* Location: ./application/controllers/Products.php */