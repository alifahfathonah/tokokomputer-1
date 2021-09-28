            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Data Barang</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Data Master</a></li>
                                <li class="breadcrumb-item active">Data Barang</li>
                            </ol>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">

                    <div class="card">

                        <div class="card-header">


                            <button type="button" class="btn btn-info btn-sm mb-2" data-toggle="modal" data-target="#tambah"><i class="fa fa-plus"></i> Tambah Data</button>


                            <button type="button" class="btn btn-secondary btn-sm mb-2"> <i class="fas fa-print"></i> Print</button>

                         
                          
                        </div>


                        <table class="table table-striped table-hover" id="example1" bordered="10px">
                            <thead align="center">
                                <tr>
                                    <th scope="col">Nomor</th>
                                    <th scope="col">Nama Barang</th>
                                    <th scope="col">Harga Barang</th>
                                    <th scope="col">Foto Barang</th>
                                    <th scope="col">Aksi</th>
                                </tr>
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
                                        <a href=" ?page=pages/barang/edit_barang&idedit=<?= $data["idbarang"] ?>" class="btn btn-warning btn-sm "><i class="fa fa-edit"> Edit</i></a>
                                        
                                        <a href="?page=pages/barang/hapus_barang&idhapus=<?= $data["idbarang"] ?>" class="btn btn-danger btn-sm "><i class="fa fa-trash"> Hapus</i></a>

                                        </td>

                                    </tr>
                                <?php
                                }

                                ?>



                            </tbody>


                        </table>

                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-end">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>

                        <div class="modal fade" id="tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Tambah Data Barang</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="#" method="POST" enctype="multipart/form-data">

                                            <div class="form-group">
                                                <label for="">Nama Barang</label>
                                                <input type="text" require name="namabarang" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Harga Barang</label>
                                                <input type="text" require name="hargabarang" id="rupiah" class="form-control form-control-sm">
                                            </div>

                                            <div class="form-group">
                                                <label for="">Foto Barang</label>
                                                <input type="file" require name="fotobarang" class="form-control form-control-sm">
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" name="simpan" class="btn btn-success">Simpan</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                    </div>
                                    </form>

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


                                </div><!-- /.container-fluid -->


                                <?php

                                if (isset($_POST['simpan'])) {

                                    $namabarang = $_POST['namabarang'];
                                    $hargabarang = $_POST['hargabarang'];
                                    $originalname = $_FILES['fotobarang']['name'];
                                    $lokasi = $_FILES['fotobarang']['tmp_name'];
                                    $size = $_FILES['fotobarang']['size'];
                                    $filename = time() . "_" . $originalname;


                                    $simpan = $koneksi->query("INSERT INTO tb_barang (idbarang, namabarang, hargabarang, fotobarang)
                                                    VALUES ('$idbarang','$namabarang','$hargabarang','$filename')");

                                    if ($simpan == True) {
                                        move_uploaded_file($lokasi, 'asset/img/barang/' . $filename);
                                        echo "<script>
                                            alert('Data Berhasil Disimpan')
                                            window.location='?page=pages/barang/index'
                                        </script>";
                                    } else {
                                        echo "<script>
                                        alert('Data Gagal Disimpan')
                                        window.location='?page=pages/barang/index'
                                    </script>";
                                    }
                                }

                                ?>
                            </div>
                        </div>
                    </div>
                </div>

            </section>


            <!-- /.content -->