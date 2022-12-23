<?php
session_start();
if (empty($_SESSION['admin_id'])) {
    header("Location:/auth/login.php");
    exit();
}
require_once 'helpers/functions.php';
$title = "Home";
require_once 'include/header.php';
?>
<div class="container mt-5">
    <div class="row mt-5">
        <div class="col-12 col-sm-12 col-md-5 bg-light rounded-3 pt-3">
            <h4 class="text-center mb-3 text-success text-decoration-underline">Medicines  </h4>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Stock</th>
                    <th scope="col">Price</th>
                    <th scope="col">Options</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $medicines = medicines();
                if($medicines->num_rows > 0)
                    while ( $row = $medicines->fetch_assoc() ){ ?>
                        <tr>
                            <th scope="row"><?php  echo $row['id'] ?></th>
                            <td><?php echo $row['name'] ?></td>
                            <td><?php echo $row['stock'] ?></td>
                            <td><?php echo $row['price'] ?></td>
                            <td class="">
                                <a href="?delete&id=<?php echo $row['id'] ?>" class="text-danger mx-2">
                                    <i class="fa fa-trash"></i>
                                </a>
                                <a href="/clients/edit.php?id=<?php echo $row['id'] ?>" class="text-primary">
                                    <i class="fa fa-edit"></i>
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
        <div class="col-md-2"></div>
        <div class="col-12 col-sm-12 col-md-5 bg-light rounded-3 pt-3">
            <h4 class="text-center mb-3 text-success text-decoration-underline">Clients  </h4>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Stock</th>
                    <th scope="col">Price</th>
                    <th scope="col">Options</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $medicines = medicines();
                if($medicines->num_rows > 0)
                    while ( $row = $medicines->fetch_assoc() ){ ?>
                        <tr>
                            <th scope="row"><?php  echo $row['id'] ?></th>
                            <td><?php echo $row['name'] ?></td>
                            <td><?php echo $row['stock'] ?></td>
                            <td><?php echo $row['price'] ?></td>
                            <td class="">
                                <a href="?delete&id=<?php echo $row['id'] ?>" class="text-danger mx-2">
                                    <i class="fa fa-trash"></i>
                                </a>
                                <a href="/clients/edit.php?id=<?php echo $row['id'] ?>" class="text-primary">
                                    <i class="fa fa-edit"></i>
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
    <div class="row my-5">
        <div class="col-12 col-sm-12 col-md-6 offset-md-3 bg-light  rounded-3 pt-3">
            <h4 class="text-center mb-3 text-success text-decoration-underline"> Invoices </h4>
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
                $invoices = $con->query("SELECT invoices.id as invoice_id ,invoices.*,clients.* from invoices left join clients on invoices.client_id = clients.id limit 10");

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
<?php require_once 'include/footer.php'; ?>





