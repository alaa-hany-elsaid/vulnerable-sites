<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header('location:/auth/login.php');
    exit();
}
require_once '../helpers/functions.php';
$title = "Medicines";
require_once '../include/header.php';
$notice = '';
if (isset($_POST['update'])) {
    if ($con->query("update medicines SET name='$_POST[name]',stock='$_POST[stock]',price='$_POST[price]' where id='$_POST[id]'")) {
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
    $medicine = $con->query("select * from medicines where id = '$_GET[id]'");
    if(! ($medicine && ($medicine->num_rows > 0)) ){
        header('location:/medicine/');
        exit();
    }
    $medicine = $medicine->fetch_assoc();
}
?>
<?php echo $notice ?>
<div class="container mt-3">
    <div class="row rounded-3 bg-light py-2 mt-4">
        <h2 class="text-success text-center  "> Medicine :  <?php echo  $medicine['name']?> </h2>
    </div>
    <div class="row mt-5 bg-light rounded-3 py-5 text-black ">
        <div class="col-10 offset-1 offset-md-3 col-md-6 ">
            <form method="post">
                <div class="mb-3 row">
                    <label for="name" class="col-sm-2 col-form-label">Name : </label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" value="<?php echo $medicine['name'] ?>">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="stock" class="col-sm-2 col-form-label">Stock : </label>
                    <div class="col-sm-10">
                        <input type="text" name="stock" class="form-control" id="stock" value="<?php echo $medicine['stock'] ?>">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="price" class="col-sm-2 col-form-label">Price : </label>
                    <div class="col-sm-10">
                        <input type="text" name="price" class="form-control" id="price" value="<?php echo $medicine['price'] ?>">
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


