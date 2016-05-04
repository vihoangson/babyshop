<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class My_resize
{
	protected $ci;

	public function __construct()
	{
        $this->ci =& get_instance();
	}

	public function resize($path,$width,$height){
		list($w,$h) = getimagesize($path);
		if($height > $h && $width > $w){
			return;
		}
		$config['source_image'] = $path;
		$config['width']        = $width;
		$config['height']       = $height;
		$this->ci->load->library('image_lib', $config); 
		$this->ci->image_lib->resize();
	}
	

}

/* End of file my_resize.php */
/* Location: ./application/libraries/my_resize.php */
