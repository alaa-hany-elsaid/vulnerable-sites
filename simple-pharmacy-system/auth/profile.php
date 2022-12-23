<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header('location:/auth/login.php');
    exit();
}
require_once '../helpers/functions.php';
$title = "Profile";
require_once '../include/header.php';
$notice = '';
if (isset($_POST['update'])) {
    if ($con->query("update admins SET name='$_POST[name]',email='$_POST[email]',password='$_POST[password]' where id='$_SESSION[admin_id]'")) {
        $_SESSION['admin_name'] = $_POST['name'];
        $_SESSION['admin_email'] = $_POST['email'];
        $_SESSION['admin_password'] = $_POST['password'];
        $notice = '<div class="alert alert-success alert-dismissible fade show d-flex align-items-center" role="alert">
  <div >
  <i class="fa fa-check-circle"></i>
    Successfully Operation
  </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>';
    } else {
        $notice = '<div class="alert alert-danger alert-dismissible fade show d-flex align-items-center" role="alert">
  <div >
  <i class="fa fa-exclamation-triangle"></i>
        Error : '. $con->error .'
  </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>';
    }
}
?>
<?php echo $notice ?>
<div class="container mt-3">
    <div class="row rounded-3 bg-light py-2 mt-4">
        <h2 class="text-success text-center  "> Profile Information </h2>
    </div>

    <div class="row mt-5 bg-light rounded-3 py-5 text-black ">
        <div class="col-10 offset-1 offset-md-3 col-md-6 ">
            <form method="post">
                <div class="mb-3 row">
                    <label for="name" class="col-sm-2 col-form-label">Name : </label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" value="<?php echo $_SESSION['admin_name'] ?>">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-2 col-form-label">Email : </label>
                    <div class="col-sm-10">
                        <input type="text" name="email" class="form-control" id="email" value="<?php echo $_SESSION['admin_email'] ?>">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="password" class="col-sm-2 col-form-label">Password : </label>
                    <div class="col-sm-10">
                        <input type="password" name="password" class="form-control" id="password" value="<?php echo $_SESSION['admin_password'] ?>">
                    </div>
                </div>
                <input hidden name="update">
                <div class="mb-3 row">
                        <button class="btn btn-success"> Update </button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php require_once '../include/footer.php' ?>


