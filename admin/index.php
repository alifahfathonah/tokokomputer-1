<?php include 'koneksi.php';

session_start();


if (!isset($_SESSION['admin'])) {
    header("location: login.php");
    die();
}

?>

<!DOCTYPE html>
<html>

<head>
    <?php include 'component/style.php'; ?>
</head>


<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Navbar -->
        <?php include 'component/navbar.php'; ?>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <?php include 'component/sidebar.php'; ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">

            <?php include 'content.php'; ?>

        </div>
        <!-- /.content-wrapper -->
        <?php include 'component/footer.php'; ?>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <?php include 'component/script.php'; ?>

</body>

</html>