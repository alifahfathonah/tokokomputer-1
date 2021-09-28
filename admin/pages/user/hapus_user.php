<?php

    $id = $_GET['idhapus'];

    $gambar = $koneksi->query("SELECT fotouser FROM tb_user WHERE iduser='$id'")->fetch_assoc();
    $namagambar = $gambar['fotouser'];
    unlink("asset/img/user/".$namagambar);
    
    $hapus = $koneksi->query("DELETE FROM tb_user WHERE iduser='$id'");

    if($hapus == True){
        echo"<script>
            alert('Data Berhasil Di Hapus')
            window.location='?page=pages/user/index'
        </script>";
    }else{
        echo"<script>
            alert('Data Gagal Di Hapus')
            window.location='?page=pages/user/index'
        </script>";
    }

?>