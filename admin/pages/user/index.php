            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Data User</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Data Master</a></li>
                                <li class="breadcrumb-item active">Data User</li>
                            </ol>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">

                    <!-- Content Header (Page header) -->


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
                                            <th scope="col">Nama Lengkap</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Password</th>
                                            <th scope="col">Foto User</th>
                                            <th scope="col">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php

                                        $no = 1;
                                        $query_tampiluser = $koneksi->query("select * from tb_user ORDER BY iduser ASC");

                                        while ($data = $query_tampiluser->fetch_assoc()) { ?>

                                            <tr>
                                                <td align="center"> <?= $no++; ?> </td>
                                                <td align="center"> <?= $data["namauser"]; ?> </td>
                                                <td align="center"> <?= $data["username"]; ?> </td>
                                                <td align="center"> <?= $data["pasword"]; ?> </td>
                                                <td align="center"> <img src="asset/img/user/<?= $data["fotouser"]; ?>" alt="1.svg" width="80px" height="50px"> </td>
                                                <td align="center"">
                                                    <a href=" ?page=pages/user/edit_user&idedit=<?= $data["iduser"] ?>" class="btn btn-warning btn-sm "><i class="fa fa-edit"> Edit</i></a>
                                                    <a href="?page=pages/user/hapus_user&idhapus=<?= $data["iduser"] ?>" class="btn btn-danger btn-sm "><i class="fa fa-trash"> Hapus</i></a>

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
                                                <h5 class="modal-title" id="exampleModalLabel">Tambah User</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="#" method="POST" enctype="multipart/form-data">

                                                    <div class="form-group">
                                                        <label for="">Nama Lengkap</label>
                                                        <input type="text" require name="namauser" class="form-control form-control-sm">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="">Username</label>
                                                        <input type="text" require name="username" class="form-control form-control-sm">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="">Password</label>
                                                        <input type="password" require name="password" class="form-control form-control-sm">
                                                    </div>


                                                    <div class="form-group">
                                                        <label for="">Foto User</label>
                                                        <input type="file" require name="fotouser" class="form-control form-control-sm">
                                                    </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" name="simpan" class="btn btn-success">Simpan</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                            </div>
                                            </form>

                                            


                                        </div><!-- /.container-fluid -->


                                        <?php

                                        if (isset($_POST['simpan'])) {

                                            

                                            $namauser = $_POST['namauser'];
                                            $username = $_POST['username'];
                                            $password = $_POST['password'];
                                            
                                            $options = [
                                                "cost"=>10
                                            ];

                                            $password_hash = password_hash($password,PASSWORD_DEFAULT,$options);

                                            $originalname = $_FILES['fotouser']['name'];
                                            $lokasi = $_FILES['fotouser']['tmp_name'];
                                            $size = $_FILES['fotouser']['size'];
                                            $filename = time() . "_" . $originalname;


                                            $simpan = $koneksi->query("INSERT INTO tb_user (iduser, namauser, username, password, fotouser)
                                                    VALUES ('$idbarang','$namauser','$username','$password_hash','$filename')");

                                            if ($simpan == True) {
                                                move_uploaded_file($lokasi, 'asset/img/user/' . $filename);
                                                echo "<script>
                                                alert('Data Berhasil Disimpan')
                                                window.location='?page=pages/user/index'
                                        </script>";
                                            } else {
                                                echo "<script>
                                                alert('Data Gagal Disimpan')
                                                window.location='?page=pages/user/index'
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

                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->