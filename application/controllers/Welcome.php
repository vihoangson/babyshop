<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends MY_Controller {

	public function index(){
		$this->twig->display("homepage/welcome",["rs"=>[1,2,3,4]]);
	}
}
