<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Control extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('Models');
    }

	public function index()
	{
       echo ("Welcome");
    }
    //login untuk siswa
    function login_siswa(){
        $as="pkl_siswa";
        $user=$this->input->post('user');
        $pass=$this->input->pos('pass');
        $respon['code:'];
        if($data=$this->Models->login($as,$user,$pass)){
        $passwd='';
        foreach($data as $key){
            $passwd=$key->password;
        }
        if($passwd!=md5($pass)){
            echo"false";
        }else{
            echo json_encode($data);
        }
        }else{echo 'user not found';}
    }
    //insert to header kelompok
    public function head_insert(){
        $param=$this->input->get('param');
        if($this->Models->insert_head($param)){
            echo'success';
        }else{
            echo 'error';
        }
    }

    public function detail_insert(){
        $param=$this->input->get('param');
        if($this->Models->insert_detail($param)){
            echo'success';
        }else{
            echo'error';
        }

    }


    //fetch siswa yang belu memiliki kelompok dalam 1 kelas
    public function fetch_siswa(){
        $id_jur=$this->input->get('jurusan');
        $kelas=$this->input->get('kelas');
        $data=$this->Models->fetch_siswa($id_jur,$kelas);
        echo json_encode($data);
    }
    //fetch DUDI yang sesuai dengan jurusan
    public function fetch_dudi(){
        $id_jur=$this->input->get('jurusan');
        $data=$this->Models->fetch_dudi($id_jur);
        echo json_encode($data);
    }
    //fetch kelompok yang belum dan sudah di acc PJ jurusan 
    public function fetch_kelompok(){
        $id_jur=$this->input->get('jurusan');
        $act=$this->input->get('act');
        $data=$this->Models->fetch_kelompok($id_jur,$act);
        echo json_encode($data);
    }
    // login untuk pj jurusan
    function login_pj(){
        $as="pkl_pj_jurusan";
        $user=$this->input->post('user');
        $pass=$this->input->post('pass');
        if($data=$this->Models->login($as,$user,$pass)){
            $passwd='';
            foreach($data as $key){
                $passwd=$key->password;
            }
            if($passwd!=md5($pass)){
                echo"false";
            }else{
                echo json_encode($data);
            }
            }else{echo 'user not found';}
       
    }
    
}
