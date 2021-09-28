<?php

    $id = $_GET['idhapus'];

    $gambar = $koneksi->query("SELECT fotobarang FROM tb_barang WHERE idbarang='$id'")->fetch_assoc();
    $namagambar = $gambar['fotobarang'];
    unlink("asset/img/barang/".$namagambar);
    
    $hapus = $koneksi->query("DELETE FROM tb_barang WHERE idbarang='$id'");

    if($hapus == True){
        echo"<script>
            alert('Data Berhasil Di Hapus')
            window.location='?page=pages/barang/index'
        </script>";
    }else{
        echo"<script>
            alert('Data Gagal Di Hapus')
            window.location='?page=pages/barang/index'
        </script>";
    }

?>