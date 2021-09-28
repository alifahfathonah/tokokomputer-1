<?php
$hasilkota = [];

    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $kota = $koneksi->query("SELECT * FROM tb_kota_rajaongkir WHERE province_id='$id'");

        while ($datakota = $kota->fetch_assoc()) {
            $hasilkota[] = $datakota; 
        }
    }
    echo json_encode($hasilkota);
?>