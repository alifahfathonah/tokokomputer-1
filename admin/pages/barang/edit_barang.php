<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Data Master</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Data Barang</li>
                    <li class="breadcrumb-item active">Edit Barang</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<?php

$id = $_GET['idedit'];
$dataedit = $koneksi->query("SELECT * FROM tb_barang WHERE idbarang='$id'")->fetch_assoc();

?>

<!-- Main content -->
<section class="content">
    <div class="container-fluid">

        <div class="card">
            <div class="card-header">Edit Data Barang</div>
            <br>
            <div class="card-body">

                <form action="#" method="POST" enctype="multipart/form-data">

                    <input type="hidden" name="id" value="<?= $dataedit["idbarang"] ?>">

                    <div class="form-group">
                        <label for="">Nama Barang</label>
                        <input type="text" name="namabarang" class="form-control" value="<?= $dataedit["namabarang"] ?>">
                    </div>

                    <div class="form-group">
                        <label for="">Harga Barang</label>
                        <input type="text" name="hargabarang" class="form-control" id="rupiah" value="<?= $dataedit["hargabarang"] ?>">
                    </div>

                    <div class="form-group">

                        <img src="asset/img/barang/<?= $dataedit["fotobarang"] ?>" width="80px" height="50">
                    </div>

                    <div class="form-group">

                        <input type="hidden" name="fotobaranglama" value="<?= $dataedit["fotobarang"] ?>">
                    </div>

                    <div class="form-group">
                        <label for="">Foto Barang</label>
                        <input type="file" name="fotobarang" class="form-control">
                    </div>

                    <button type="submit" name="edit" class="btn btn-warning btn-block">Update</button>



                </form>


                <?php
                if (isset($_POST['edit'])) {
                    
                    $idbarang       = $_POST['id'];
                    $namabarang     = $_POST['namabarang'];
                    $hargabarang    = $_POST['hargabarang'];
                    $fotolama       = $_POST['fotobaranglama'];
                    $originalname   = $_FILES['fotobarang']['name'];
                    $lokasi         = $_FILES['fotobarang']['tmp_name'];
                    $size           = $_FILES['fotobarang']['size'];
                    $filename       = time()."_".$originalname;

                    if ($size > 1000000) {
                        echo "<script>
                                        alert('data Max 1 Mb')
                                        window.location='?page=pages/barang/edit_barang&idedit=" . $id . "'
                                    </script>";
                    } else {
                        if (!empty($lokasi)) {
                            unlink("asset/img/barang/". $fotolama);
                            move_uploaded_file($lokasi, "asset/img/barang/" . $filename);
                            $update = $koneksi->query("UPDATE tb_barang SET namabarang='$namabarang',hargabarang='$hargabarang',fotobarang='$filename' WHERE idbarang='$idbarang'");
                        } else {
                            $update = $koneksi->query("UPDATE tb_barang SET namabarang='$namabarang',hargabarang='$hargabarang',fotobarang='$filename' WHERE idbarang='$idbarang'");
                        }

                        if ($update == True) {
                            echo "<script>
                                alert('Data Berhasil Diedit')
                                window.location='?page=pages/barang/index'
                            </script>";
                        } else {
                            echo "<script>
                                alert('Data Gagal Diedit')
                                window.location='?page=pages/barang/edit_barang&idedit=" . $id . "'
                            </script>";
                        }
                    }
                }
                ?>

                <script type="text/javascript">
                    var rupiah = document.getElementById('rupiah');
                    rupiah.addEventListener('keyup', function(e) {
                        rupiah.value = formatRupiah(this.value, 'Rp. ');

                    });

                    function formatRupiah(angka, prefix) {
                        var number_string = angka.replace(/[^,\d]/g, '').toString(),
                            split = number_string.split(','),
                            sisa = split[0].length % 3,
                            rupiah = split[0].substr(0, sisa),
                            ribuan = split[0].substr(sisa).match(/\d{3}/gi);


                        if (ribuan) {
                            separator = sisa ? '.' : '';
                            rupiah += separator + ribuan.join('.');
                        }
                        rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
                        return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
                    }
                </script>



            </div>
        </div>


    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->