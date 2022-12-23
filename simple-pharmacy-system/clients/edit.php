<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header('location:/auth/login.php');
    exit();
}


require_once '../helpers/functions.php';
$title = "Clients";
require_once '../include/header.php';
$notice = '';



if (isset($_POST['update'])) {
    if ($con->query("update clients SET name='$_POST[name]',phone='$_POST[phone]',address='$_POST[address]' where id='$_POST[id]'")) {
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
}else{
    $client = $con->query("select * from clients where id = '$_GET[id]'");
    if(! ($client && ($client->num_rows > 0)) ){
        header('location:/clients/');
        exit();
    }
    $client = $client->fetch_assoc();
}
?>
<?php echo $notice ?>
<div class="container mt-3">
    <div class="row rounded-3 bg-light py-2 mt-4">
        <h2 class="text-success text-center  "> Client :  <?php echo  $client['name']?> </h2>
    </div>
    <div class="row mt-5 bg-light rounded-3 py-5 text-black ">
        <div class="col-10 offset-1 offset-md-3 col-md-6 ">
            <form method="post">
                <div class="mb-3 row">
                    <label for="name" class="col-sm-2 col-form-label">Name : </label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" value="<?php echo $client['name'] ?>">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="phone" class="col-sm-2 col-form-label">Phone : </label>
                    <div class="col-sm-10">
                        <input type="text" name="phone" class="form-control" id="phone" value="<?php echo $client['phone'] ?>">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="address" class="col-sm-2 col-form-label">Address : </label>
                    <div class="col-sm-10">
                        <input type="text" name="address" class="form-control" id="address" value="<?php echo $client['address'] ?>">
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


