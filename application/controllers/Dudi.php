<?php
 header('Content-Type: application/json');
defined('BASEPATH') OR exit('No direct script access allowed');

class Dudi extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('Models');
    }
	public function index()
	{
        $id=$this->input->get('jurusan');
        $data=$this->Models->fetch_dudi($id);
        http_response_code(200);
        $obj=array();
        $obj['resCode']="200";
        $obj['status']="sucess";
        $obj['error']="";
        $obj['dudis']=$data;
        echo json_encode($obj);
    }
    public function getData($id=null)
    {
        $data=$this->Models->fetch_dudi($id);
        http_response_code(200);
        $obj=array();
        $obj['resCode']="200";
        $obj['status']="sucess";
        $obj['error']="";
        $obj['dudis']=$data;
        echo json_encode($obj);
    }
}