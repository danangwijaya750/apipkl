<?php
 header('Content-Type: application/json');
defined('BASEPATH') OR exit('No direct script access allowed');

class Siswa extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('Models');
    }

	public function index()
	{
        $id_jur=$this->input->get('jurusan');
        $kelas=$this->input->get('kelas');
        $data=$this->Models->fetch_siswa($id_jur,$kelas);
        $obj = array();
        $obj['resCode']="200";
        $obj['status']="sucess";
        $obj['error']="";
        $obj['siswas']=$data;
        echo json_encode($obj);
    }
}