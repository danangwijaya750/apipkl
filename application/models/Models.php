<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Models extends CI_Model {
    function fetchall(){
        return $this->db->query("Select * from pkl_jurusan")->result();
    }
    function login($role,$user,$pass){
        return $this->db->query("Select * from $role where username='$user'")->result();
    }
    function fetch_siswa($id_jur,$kelas){
        return $this->db->query("Select * from pkl_siswa s where s.id_jurusan=$id_jur and s.kelas='$kelas' and s.id not in(select id_siswa from pkl_detail_kelompok)")->result();
    }
    function fetch_dudi($id_jur){
        return $this->db->query("select * from pkl_dudi where id_jurusan=$id_jur")->result();
    }
    function fetch_kelompok($id_jur,$act){
        return $this->db->query("select * from pkl_kelompok where id_jurusan=$id_jur and verif_by_pj=$act")->result();
    }
    public function insert_head($param)
    {
        return $this->db->query("insert into pkl_kelompok(id_jurusan,id_dudi,tahun,period)values($param)");
    }
    public function insert_detail($param){
        return $this->db->query("insert into pkl_detail_kelompok (id_kelompok,id_siswa) values ($param)");
    }
    public function acc_by_pj($param){
        return $this->db->query("update pkl_kelompok set verif_by_pj=1 where id=$param");
    } 
    public function acc_dudi($param){
        return $this->db->query("update pkl_detail_kelompok set acc=1 where id=$param");
    }
}
