<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header('location:/auth/login.php');
    exit();
}
require_once '../helpers/functions.php';
$title = "Invoices";
require_once '../include/header.php';
$notice = '';
if  (isset($_GET['delete'])) {
    if ($con->query("delete from invoices where id = '$_GET[id]'")) {
        $notice = '<div class="alert alert-success alert-dismissible fade show d-flex align-items-center" role="alert">
  <div >
  <i class="fa fa-check-circle"></i>
    Successful Operation
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
        <div class="col-10 offset-1">
            <div class="d-flex justify-content-between text-success">
                <h2 > Invoices </h2>
                <a href="create.php" class="btn btn-success" >  Create Invoice </a>
            </div>
        </div>

    </div>

    <div class="row mt-5    ">
        <div class="col-10 offset-1 bg-light rounded-3 col-md-10 ">

            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Client Name</th>
                    <th scope="col">Client Phone</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $invoices = $con->query("SELECT invoices.id as invoice_id ,invoices.*,clients.* from invoices left join clients on invoices.client_id = clients.id");

                if($invoices->num_rows > 0)
                    while ( $row = $invoices->fetch_assoc() ){ ?>
                        <tr>
                            <th scope="row"><?php  echo $row['invoice_id'] ?></th>
                            <td><?php echo $row['total_price'] ?></td>
                            <td><?php echo $row['name'] ?></td>
                            <td><?php echo $row['phone'] ?></td>
                            <td class="">
                                <a href="?delete&id=<?php echo $row['invoice_id'] ?>" class="text-danger mx-2">
                                    <i class="fa fa-trash"></i>
                                </a>
                                <a href="/invoices/show_info.php?id=<?php echo $row['invoice_id'] ?>" class="text-primary">
                                    <i class="fa fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    <?php }
                else{
                    ?>
                    <tr>
                        <th colspan="5" > No Data</th>
                    </tr>
                <?php }?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php require_once '../include/footer.php' ?>


