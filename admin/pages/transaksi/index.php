<?php

error_reporting(false);
session_start();

?>

<section class="content">

    <div class="row">
        <div class="col-md-12">
            <div class="card">

                <div class="card-header">
                    <h5 class="card-title">Input Data Penjualan</h5>
                </div>

                <div class="card-body">

                    <form action="#" method="POST" enctype="multipart/form-data">
                        <div class="col-md-12">

                            <div class="form-group">
                                <label for="">ID Barang</label>
                                <input type="text" require name="idbarang" id="idbarang" class="form-control form-control-sm" readonly>
                            </div>

                            <div class="form-group">
                                <button type="button" class="btn btn-sm btn-info" data-target="#tambah" data-toggle="modal"> Cari Barang </button>
                            </div>

                            <div class="form-group">
                                <label for="">Nama Barang</label>
                                <input type="text" require name="namabarang" id="namabarang" class="form-control form-control-sm" readonly>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Harga Barang</label>
                                    <input type="text" require name="hargabarang" id="hargabarang" class="form-control form-control-sm" readonly>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Quantity</label>
                                    <input type="text" require name="qtyjual" id="qtyjual" class="form-control form-control-sm" onkeyup="totalharga()">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Total Harga</label>
                                    <input type="text" require name="hargabarangtotal" id="rupiah" class="form-control form-control-sm">
                                </div>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="submit" name="simpan" class="btn btn-success btn-sm"><i class="fas fa-plus"> Masukan Keranjang</i></button>
                        </div>
                    </form>


                    <?php

                    if (isset($_POST['simpan'])) {

                        $idbarang = $_POST['idbarang'];
                        $namabarang = $_POST['namabarang'];
                        $hargabarang = $_POST['hargabarang'];
                        $qtyjual = $_POST['qtyjual'];
                        $hargabarangtotal = $_POST['hargabarangtotal'];

                        $simpan = $koneksi->query("INSERT INTO tb_jual_temp (idbarang_temp, namabarang_temp, hargabarang_temp,
                                qty_temp, totalharga_temp)
                        VALUES ('$idbarang','$namabarang','$hargabarang','$qtyjual',' $hargabarangtotal')");

                        if ($simpan == True) {
                            echo "<script>
                                alert('Data Berhasil Masuk Keranjang')
                                window.location='?page=pages/transaksi/index'
                            </script>";
                        } else {
                            echo "<script>
                            alert('Data Gagal Masuk Keranjang')
                            window.location='?page=pages/transaksi/index'
                        </script>";
                        }
                    }

                    ?>



                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Data Barang</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <table class="table table-sm table-striped">
                        <thead align="center">
                            <th>No</th>
                            <th>Nama Barang</th>
                            <th>Harga Barang</th>
                            <th>Foto Barang</th>
                            <th>Aksi</th>
                        </thead>

                        <tbody>
                            <?php

                            $no = 1;
                            $query_tampilbarang = $koneksi->query("select * from tb_barang ORDER BY idbarang ASC");

                            while ($data = $query_tampilbarang->fetch_assoc()) { ?>

                                <tr>
                                    <td align="center"> <?= $no++; ?> </td>
                                    <td align="center"> <?= $data["namabarang"]; ?> </td>
                                    <td align="center"> <?= $data["hargabarang"]; ?> </td>
                                    <td align="center"> <img src="asset/img/barang/<?= $data["fotobarang"]; ?>" alt="barang.png" width="80px" height="30px"> </td>
                                    <td align="center"">
                                                        <button type=" button" class="btn btn-success btn-sm" onclick="pilihbarang('<?= $data['idbarang']; ?>','<?= $data['namabarang']; ?>','<?= $data['hargabarang']; ?>')">
                                        Pilih</i></button>


                                    </td>

                                </tr>
                            <?php
                            }

                            ?>
                        </tbody>
                    </table>

                    <script type="text/javascript">
                        function pilihbarang(id, nama, harga) {
                            $('#idbarang').val(id);
                            $('#namabarang').val(nama);
                            $('#hargabarang').val(harga);
                            $('#tambah').modal('hide');
                            $('.modal-backdrop').hide();
                        }

                        function totalharga() {

                            var jumlah = document.getElementById('qtyjual').value;
                            var harga = document.getElementById('hargabarang').value;
                            harga = Number(harga.replace(/[^\d]/g, ""));

                            $('#rupiah').val((jumlah * harga));
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">

                <div class="card-header">
                    <h5 class="card-title">Data Pembelian Barang Konsumen</h5>
                </div>

                <div class="modal-footer">
                    <a href="?page=pages/transaksi/chekout" class="btn btn-warning btn-sm" type="submit" name="simpan" class="btn btn-warning 				btn-sm"><i class="fas fa-cart-plus"> Check Out</i></a>
                    <button type="button" name="hapus" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#hapustransaksi"><i class="fas fa-trash-alt"> Bersihkan Keranjang</i></button>

                    <?php
                    if (isset($_POST['hapus'])) {


                        $hapus = $koneksi->query("DELETE FROM tb_jual_temp");

                        if ($hapus == True) {

                            echo "<script>
                                    alert('Kerajang Berhasil Dikosongkan')
                                    window.location = '?page=pages/transaksi/index'
                                </script>";
                        } else {
                            echo "<script>
                                    alert('Hapus Keranjang Gagal')
                                    window.location = '?page=pages/transaksi/index'
                                </script>";
                        }
                    }

                    ?>

                </div>

                <div class="card-body">
                    <table class="table table-sm table-striped" id="datacustomer">
                        <thead align="center">
                            <th>No</th>

                            <th>Nama Barang</th>
                            <th>Harga Barang</th>
                            <th>Qty</th>
                            <th>Total</th>

                        </thead>
                        <tbody>

                            <?php

                            $no = 1;
                            $totalbayar = 0;
                            $query_tampilbarang_temp = $koneksi->query("select * from tb_jual_temp");

                            while ($data = $query_tampilbarang_temp->fetch_assoc()) {
                                $totalbayar = $totalbayar + $data["totalharga_temp"];
                            ?>

                                <tr>
                                    <td align="center"> <?= $no++; ?> </td>
                                    <td align="center"> <?= $data["namabarang_temp"]; ?> </td>
                                    <td align="center"> <?= $data["hargabarang_temp"]; ?> </td>
                                    <td align="center"> <?= $data["qty_temp"]; ?> </td>
                                    <td align="center"> <?= $data["totalharga_temp"]; ?> </td>


                                </tr>
                            <?php
                            }

                            ?>

                            <tr>
                                <th colspan="4">Total Bayar</th>
                                <th class="text-center"><?= $totalbayar ?></th>
                            </tr>

                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>

    <div class="modal fade" id="hapustransaksi" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Hapus data keranjang ?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>

                <form method="POST">
                    <div class="modal-footer">
                        <button type="submit" name="hapus" class="btn btn-danger"><i class="fas fa-trash"></i> Hapus</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-times"></i> Batal</button>
                    </div>
                </form>

            </div>
        </div>
    </div>


</section>