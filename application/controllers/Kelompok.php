<?php
 header('Content-Type: application/json');
defined('BASEPATH') OR exit('No direct script access allowed');

class Kelompok extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('Models');
    }

	public function index()
	{
        $id_jur=$this->input->post('jurusan');
        $act=$this->input->get('act');
        $data=$this->Models->fetch_kelompok($id_jur,$act);
        echo json_encode($data);
    }

    public function create()
    {
        $param=$this->input->get('data');
        $result=$this->Models->insert_head($param);
        if($result!=null){
            echo'success';
            $obj['status']="success";
            $obj['error']="";
        }else{
            $obj['status']="error";
            $obj['error']="cannot insert";
        }
        $data=null;
        http_response_code(200);
        $obj['resCode']="200";
        $obj['response']="$result";
        echo json_encode($obj);
    }
    public function detail_insert()
    {
        $param=$this->input->get('data');
        $result=$this->Models->insert_detail($param);
        if($result!=null){
            echo'success';
            $obj['status']="success";
            $obj['error']="";
        }else{
            $obj['status']="error";
            $obj['error']="cannot insert";
        }
        $data=null;
        http_response_code(200);
        $obj['resCode']="200";
        $obj['response']="$result";
        echo json_encode($obj);
    }
  
    


}