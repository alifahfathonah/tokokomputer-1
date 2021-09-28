<?php

    $guzzle = new \GuzzleHttp\Client(['base_uri' => 'https://api.rajaongkir.com/starter/']);

    $ambildata = $guzzle->request("GET","city",[
        'headers' => [
            'key' => '7ebde981b696616d489a1401c842b503'
        ],

    ]);

    $kota = json_decode($ambildata->getBody(),true);
    foreach ($kota['rajaongkir']['results'] as $detailkota){
        
        $koneksi->query("INSERT INTO tb_kota_rajaongkir VALUES('$detailkota[city_id]','$detailkota[city_name]','$detailkota[province_id]')");
    }

?>