<?php
session_start();
if (isset($_SESSION['admin_id'])) {
    header("Location:/index.php");
    exit();
}
require_once "../helpers/functions.php";
$notice =" ";
if (isset($_POST['login'])) {
    $user = $_POST['email'];
    $pass = $_POST['password'];
    $result = $con->query("select * from admins where email='$user' AND password='$pass'");
    if (($result) && ($result->num_rows > 0)) {
        $data = $result->fetch_assoc();
        $_SESSION['admin_id'] = $data['id'];
        $_SESSION['admin_name'] = $data['name'];
        $_SESSION['admin_email'] = $data['email'];
        $_SESSION['admin_password'] = $data['password'];
        header('location:/index.php');
        exit();
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
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fonts/font-awesome/css/font-awesome.min.css">
    <script src='/assets/js/bootstrap.bundle.min.js'></script>
</head>
<body style="background: url('/assets/images/login.jpg') no-repeat fixed ; background-size: auto; ">

        <?php echo $notice ?>

            <div class="d-flex flex-column justify-content-center align-items-center " style="height: 100vh">
                   <div class="d-flex flex-column justify-content-center align-items-baseline px-5 py-5 bg-light rounded-3">
                       <h3 class="text-success mb-5"> Welcome to Pharmacy System </h3>
                       <form method="post" class="w-100">
                           <div class="mb-3 w-100">
                               <label for="email" class="form-label">Email :</label>
                               <input type="text" name="email" class="form-control " id="email" value="">
                           </div>
                           <div class="mb-3 w-100">
                               <label for="password" class="form-label">Password :</label>
                               <input type="password" name="password" class="form-control" id="password" value="">
                           </div>
                           <input hidden name="login">
                           <div class="mb-3 w-100">
                               <button class="btn btn-primary"> Login </button>
                           </div>
                       </form>
                   </div>
            </div>
</body>
</html>

