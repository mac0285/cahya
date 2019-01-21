<?php
class Pengguna extends CI_Controller{
	function __construct(){
		parent::__construct();
		if($this->session->userdata('masuk') !=TRUE){
            $url=base_url();
            redirect($url);
        };
		$this->load->model('m_pengguna');
	}
	function index(){
	if($this->session->userdata('akses')=='1'){
		$data['data']=$this->m_pengguna->get_pengguna();
		$this->load->view('admin/v_pengguna',$data);
	}else{
        echo "Halaman tidak ditemukan";
    }
	}

	function tambah_pengguna(){
	if($this->session->userdata('akses')=='1'){
		$nama=$this->input->post('nama');
		$username=$this->input->post('username');
		$password=$this->input->post('password');
		$password2=$this->input->post('password2');
		$level=$this->input->post('level');
		$cabang=$this->input->post('cabang');
		if ($password2 <> $password) {
			echo $this->session->set_flashdata('msg','<label class="label label-danger">Password yang Anda Masukan Tidak Sama</label>');
			redirect('admin/pengguna');
		}else{
			$this->m_pengguna->simpan_pengguna($nama,$username,$password,$level,$cabang);
			echo $this->session->set_flashdata('msg','<label class="label label-success">Pengguna Berhasil ditambahkan</label>');
			redirect('admin/pengguna');
		}
		
	}else{
        echo "Halaman tidak ditemukan";
    }
	}
	function edit_pengguna(){
	if($this->session->userdata('akses')=='1'){
		$kode=$this->input->post('kode');
		$nama=$this->input->post('nama');
		$username=$this->input->post('username');
		$password=$this->input->post('password');
		$password2=$this->input->post('password2');
		$level=$this->input->post('level');
		$status=$this->input->post('status');
		$cabang=$this->input->post('cabang');
       		if (empty($password) && empty($password2)) {
			$this->m_pengguna->update_pengguna_nopass($kode,$nama,$username,$level,$status,$cabang);
			echo $this->session->set_flashdata('msg',' <div class="alert alert-success">  
       <a href="#" class="close" data-dismiss="alert">&times;</a>  
       <strong>Success!</strong> Pengguna Berhasil diupdate   </div>');
			redirect('admin/pengguna');
		}elseif ($password2 <> $password) {
			echo $this->session->set_flashdata('msg','<div class="alert alert-danger">  
       <a href="#" class="close" data-dismiss="alert">&times;</a>  
       <strong>Error!</strong>  Password yang Anda Masukan Tidak Sama </div>');
			redirect('admin/pengguna');
		}else{
			$this->m_pengguna->update_pengguna($kode,$nama,$username,$password,$level,$user_level,$cabang);
			echo $this->session->set_flashdata('msg',' <div class="alert alert-success">  
       <a href="#" class="close" data-dismiss="alert">&times;</a>  
       <strong>Success!</strong> Pengguna Berhasil diupdate  </div>');
			redirect('admin/pengguna');
		}
	}else{
        echo "Halaman tidak ditemukan";
    }
	}
	function nonaktifkan(){
	if($this->session->userdata('akses')=='1'){
		$kode=$this->input->post('kode');
		$this->m_pengguna->update_status($kode);
		redirect('admin/pengguna');
	}else{
        echo "Halaman tidak ditemukan";
    }
	}
}