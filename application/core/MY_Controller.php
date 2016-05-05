<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$config = [
			'paths' => [APPPATH.'views', VIEWPATH],
			'cache' => APPPATH.'cache',
		];
		$this->load->library('twig');
		$this->twig->addGlobal("url_template_admin","/assets/template_admin/");

		//============ ============  ============  ============ 
		//
		if(!is_dir(FCPATH."assets/uploads")){
			if(!mkdir(FCPATH."assets/uploads")){
				echo "Don't exists folder uploads";
				die;
			}
		}
		//
		//============ ============  ============  ============ 


	}
}

class Admin extends MY_Controller {

	public $data;

	public function __construct()
	{
		parent::__construct();
		if (empty($this->session->userdata['admin_user_id']) && !in_array('login', $this->uri->segment_array())) {
			redirect('/admin/users/login','auto');
		}
	}
}

class Frontend extends MY_Controller {

	public $data;

	public function __construct()
	{
		parent::__construct();
	}
}

/* End of file MY_Controller.php */
/* Location: ./application/core/MY_Controller.php */