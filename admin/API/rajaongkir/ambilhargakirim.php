<?php

    $guzzle = new \GuzzleHttp\Client(['base_uri' => 'https://api.rajaongkir.com/starter/']);

    $result = $guzzle->request("POST","cost",[
        'headers' => [
            'key' => '7ebde981b696616d489a1401c842b503'
        ],
        'json' => [
            'origin' => 31,
            'destination' => $_GET['city_id'],
            'weight' => $_GET['berat'],
            'courier' => $_GET['exp']
        ]

    ]);
    
    echo $result->getBody();

?>
