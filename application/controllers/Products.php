<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends Frontend {

	public function __construct(){
		parent::__construct();
		$this->load->model('categories');
		$categories = $this->categories->get_all();
		CommonHelper::_set_level_parent_id($categories);
		$this->twig->addGlobal("categories",$categories);
	}

	/**
	* Trang chủ page
	*
	* @return void
	* @author Santo
	**/
	public function index()
	{
		$this->view="products/index";
		$this->show_product();
	}

	/**
	* Trang chi tiết nhóm
	*
	* @return void
	* @author Santo
	**/
	public function tags($tags=null){
		//dd($tags);
		$this->view="products/category";
		$this->search = [
			"conditions" => [
				"tags like \"%".$tags."%\"",
			]
		];
		$this->show_product();
	}


	/**
	* Trang chi tiết nhóm
	*
	* @return void
	* @author Santo
	**/
	public function category($slug=null){
		$id = $this->categories->where("slug",$slug)->get()->id;
		$this->view="products/category";
		$this->search = [
			"conditions" => [
				"category =".$id."",
			]
		];
		$this->show_product();
	}

	public function show_product($options=[])
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



		// Set perpage
		if($this->session->userdata('perpage')){
			$perpage= $this->session->userdata('perpage');
		}else{
			$perpage= 9;
		}

		$this->products_model->pagination_delimiters = ["<li>","</li>"];
		
		if($this->search["conditions"])
		foreach ($this->search["conditions"] as $key => $value) {
			$this->products_model->where($value,null,null,null,null,true);
		}
		$total_posts     = $this->products_model->count_rows(); // retrieve the total number of posts
		
		if($this->search["conditions"])
		foreach ($this->search["conditions"] as $key => $value) {
			$this->products_model->where($value,null,null,null,null,true);
		}

		// Sort type
		$this->_set_order($this->products_model);

		$rs              = $this->products_model->with_product_images()->paginate($perpage,$total_posts); // paginate with 10 rows per page
		$number_of_pages = ceil($total_posts / $perpage);
		if($number_of_pages>1){
			$pagination = '<ul class="pagination">'.$this->products_model->all_pages.'</ul>'; // will output links to all pages like this model: "< 1 2 3 4 5 >". It will put a link if the page number is not the "current page"
		}else{
			$pagination ="";
		}
		if($this->view){
			$view = $this->view;
		}else{
			$view = "products/index";	
		}
		$this->twig->display($view,compact("rs","pagination"));

	}

	/**
	* Trang chi tiết sản phẩm
	*
	* @return void
	* @author Santo
	**/
	public function detail($id=null){
		$rs = $this->products_model->with_categories()->with_product_images()->get($id);
		$this->twig->display("products/detail",compact("rs"));
	}

	/**
	* Trang chủ page
	*
	* @return void
	* @author Santo
	**/
	private function _set_order(&$modal){
		if($this->session->userdata('sorttype')){
			$sorttype = explode(":",$this->session->userdata('sorttype'));
			$modal->order_by($sorttype[0],strtoupper($sorttype[1]));
		}
	}

	/**
	* Trang chủ page
	*
	* @return void
	* @author Santo
	**/
	private function _set_perpage(&$modal){
		if($this->session->userdata('perpage')){
			$perpage = $this->session->userdata('perpage');
			$modal->limit($perpage);
		}
	}
}

/* End of file Products.php */
/* Location: ./application/controllers/Products.php */