<?php require('../koneksi.php'); 

require_once ('../../vendor/autoload.php');

if(!empty($_GET["page"])){
    include_once($_GET["page"]. ".php");
}else{
    echo json_encode([]);
}
?>