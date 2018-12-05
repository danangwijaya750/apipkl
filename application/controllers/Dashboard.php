<?php
 header('Content-Type: application/json');
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('Models');
    }

	public function index()
	{
        $user=$this->input->get('username');
        $obj=array();
        $obj['resCode']="200";
        $obj['status']="1";
        $obj['err']="";
        if($data=$this->Models->Dashboard($user)){
            $obj['kelompok']=$data;
            echo json_encode($obj);
        }else{
            $obj['status']="0";
            $obj['err']="";
        }
    }
}
