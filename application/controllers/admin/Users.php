<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends Admin {

	public function login()
	{
		if(!empty($this->session->userdata['admin_user_id'])){
			redirect('/admin/product','refresh');
		}

		if($this->input->post()){
			$username = $this->input->post("username");
			$password = md5($this->input->post("password"));
			$this->load->model('users_model');
			$rs = $this->users_model->where(["name"=>$username,"password"=>$password])->get();
			if(count($rs)==1){
				$this->session->set_flashdata('alert_success', 'Đăng nhập thành công');
				$array = array(
					'admin_user_id' => $rs->id,
				);
				$this->session->set_userdata( $array );
				redirect('/admin/product','refresh');
			}else{
				$this->session->set_flashdata('alert_error', 'Không đúng');
				redirect('/admin/users/login','refresh');
			}
		}
		$this->twig->display("admin/users/login");
	}
}

/* End of file User.php */
/* Location: ./application/controllers/admin/User.php */