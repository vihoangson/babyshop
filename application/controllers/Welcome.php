<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends MY_Controller {

	public function index(){
		$this->load->library('migration');

		if ( ! $this->migration->current()){
			show_error($this->migration->error_string());
		}
		
		$this->twig->display("homepage/welcome",["rs"=>[1,2,3,4]]);
	}
}
