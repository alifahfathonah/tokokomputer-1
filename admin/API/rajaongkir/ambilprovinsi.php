<?php

    $guzzle = new \GuzzleHttp\Client(['base_uri' => 'https://api.rajaongkir.com/starter/']);

    $ambildata = $guzzle->request("GET","province",[
        'headers' => [
            'key' => '7ebde981b696616d489a1401c842b503'
        ],
    ]);

    $provinsi = json_decode($ambildata->getBody(),true);
    foreach ($provinsi['rajaongkir']['results'] as $detailprovinsi){
        
        $koneksi->query("INSERT INTO tb_provinsi_rajaongkir VALUES('$detailprovinsi[province_id]','$detailprovinsi[province]')");
    }
?>