<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Models extends CI_Model {
    function login_siswa($username){
        return $this->db->query("SELECT s.*, dk.id_kelompok FROM pkl_siswa s LEFT JOIN pkl_detail_kelompok dk on s.id=dk.id_siswa WHERE s.username='$username' ")->result();
    }

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
        $doing = $this->db->query("insert into pkl_kelompok(id_jurusan,id_dudi,tahun,period)values($param)");
        return $this->db->insert_id($doing);
    }
    public function insert_detail($param){
        $doing = $this->db->query("insert into pkl_detail_kelompok (id_kelompok,id_siswa) values ($param)");
        return $this->db->insert_id($doing);
    }
    public function acc_by_pj($param){
        return $this->db->query("update pkl_kelompok set verif_by_pj=1 where id=$param");
    } 
    public function acc_dudi($param){
        return $this->db->query("update pkl_detail_kelompok set acc=1 where id=$param");
    }
    public function GetDash($param){
     return $this->db->query("select k.id,k.id_jurusan,k.id_dudi,k.verif_by_pj,dk.id_siswa, s.nama,d.nama_perusahaan,dk.acc FROM pkl_kelompok k INNER JOIN pkl_detail_kelompok dk on k.id= dk.id_kelompok INNER JOIN pkl_siswa s ON dk.id_siswa=s.id INNER JOIN pkl_dudi d on k.id_dudi= d.id  WHERE k.id=$param")->result();
    }
    public function Dashboard($param)
    {
     return $this->db->query("SELECT s.id, dk.id_kelompok FROM pkl_siswa s LEFT JOIN pkl_detail_kelompok dk on s.id=dk.id_siswa WHERE s.username='$param' ")->result();   
    }
    public function inserting($data)
    {
        $this->db->insert('pkl_kelompok', $data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
}
