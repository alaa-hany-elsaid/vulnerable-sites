<?php

session_start();
if (!isset($_SESSION['admin_id'])) {
    header('location:/auth/login.php');
    exit();
}
require_once '../helpers/functions.php';
$title = "Invoices";
require_once '../include/header.php';
if (!isset($_GET['id'])) {
    header("location:/invoices/index.php");
    exit();
}
$invoice = $con->query("SELECT invoices.id as invoice_id ,invoices.*,clients.* from invoices left join clients on invoices.client_id = clients.id where invoices.id = '$_GET[id]' ");
if (($invoice) && ($invoice->num_rows > 0)) {
    $invoice = $invoice->fetch_assoc();

} else {
    header("location:/invoices/index.php");
    exit();

}
?>

<div class="container mt-3">
    <div class="row rounded-3 bg-light py-2 mt-4">
        <div class="col-10 offset-1">
            <div class="d-flex flex-column  text-success">
                <h2 class="text-center"> Invoice No.#<?php echo $invoice['invoice_id'] ?> </h2>
                <div>
                    <h5>Client Name : <?php echo  $invoice['name'] ?> </h5>
                    <h5>Client Phone : <?php echo $invoice['phone'] ?> </h5>
                    <h5>Client Phone : <?php  echo $invoice['address'] ?> </h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5    ">
        <div class="col-10 offset-1 bg-light rounded-3 col-md-10 ">

            <table class="table table-striped text-center" >
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Medicine Name</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Number of Items</th>
                </tr>
                </thead>
                <tbody  >
                <?php
                $invoices_content = $con->query("SELECT * from medicines left join invoices_content on medicines.id = invoices_content.medicine_id where  invoices_content.invoice_id =  '$invoice[invoice_id]'");
                if ($invoices_content->num_rows > 0)
                    while ($row = $invoices_content->fetch_assoc()) { ?>
                        <tr>
                            <th scope="row"><?php echo $row['id'] ?></th>
                            <td><?php echo $row['name'] ?></td>
                            <td><?php echo $row['total_price'] ?></td>
                            <td><?php echo $row['total_price'] / $row['price'] ?></td>

                        </tr>
                    <?php }
                else {
                    ?>
                    <tr>
                        <th colspan="4"> No Data</th>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php require_once '../include/footer.php' ?>


