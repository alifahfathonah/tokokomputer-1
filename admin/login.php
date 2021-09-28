<?php include 'koneksi.php';

session_start();


if (isset($_SESSION['admin'])) {
    header("location: index.php");
    die();
}

?>


<!DOCTYPE html>
<html>

<head>
    <?php include 'component/style.php'; ?>
</head>

<body class="hold-transition login-page">
    <div class="login-box">
    <h5 class="login-box-msg">MEDIATAMA COMPUTER</h5>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">

                <p class="login-box-msg">Silahkan Login</p>

                <form action="#" method="post">
                    <div class="input-group mb-3">
                        <input type="text" name="username" class="form-control username" placeholder="Username">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user-circle"></span>

                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" name="password" class="form-control password" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>

                    <div class="social-auth-links text-center mb-3">

                        <button type="submit" name="login" class="btn btn-block btn-primary">
                            </i> Sign In</button>
                        </a>

                    </div>

                </form>

                </div>
    <!-- /.login-card-body -->
    <p class="login-box-msg">dp99 Corp</p>
    </div>
    </div>

                <?php

                if (isset($_POST['login'])) {
                    $username = $_POST['username'];
                    $password = $_POST['password'];
                   

                    $cek_user = $koneksi->query("SELECT * FROM tb_user WHERE username = '$username' AND pasword = '$password' ")->fetch_assoc();

                    if ($cek_user == True) {
                        $_SESSION['admin'] = $cek_user;
                        echo "<script>
                                alert('Login Sukses');
                                window.location='index.php';
                            </script>";
                    } else {
                        echo "<script>
                            alert('Periksa Username dan Password Anda');
                            window.location='login.php';
                            </script>";
                    }
                }

                ?>


            </div>

        </div>
    </div>


    <?php include 'component/script.php' ?>
</body>

</html>