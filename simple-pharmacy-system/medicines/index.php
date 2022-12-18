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
if (isset($_POST['add'])  || (isset($_GET['delete']))) {
    if(isset($_POST['add']))
        $query = "insert into  medicines values  (NULL , '$_POST[name]' , '$_POST[stock]' ,   '$_POST[price]' )" ;
    else
        $query = "delete from medicines where id = '$_GET[id]'";
    if ($con->query($query)) {
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
        <div class="col-10 offset-1">
            <div class="d-flex justify-content-between text-success">
                <h2 > Medicines </h2>
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#create-client">  Add Medicine </button>
            </div>
        </div>

    </div>

    <div class="row mt-5    ">
        <div class="col-10 offset-1 bg-light rounded-3 col-md-10 ">

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
                $medicines = medicines(200);
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
                                <a href="/medicines/edit.php?id=<?php echo $row['id'] ?>" class="text-primary">
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
</div>
<div class="modal fade modal-dialog modal-dialog-centered" id="create-client" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"  aria-hidden="true">
    <div class="modal-dialog">
        <form class="modal-content" method="post">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Add Medicine</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label for="name" class="col-sm-3 col-form-label">Name : </label>
                    <div class="col-sm-9">
                        <input type="text" name="name" required class="form-control" id="name" value="">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="stock" class="col-sm-3 col-form-label">Stock : </label>
                    <div class="col-sm-9">
                        <input type="text" name="stock" required class="form-control" id="stock" value="">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="price" class="col-sm-3 col-form-label">Price :</label>
                    <div class="col-sm-9">
                        <input type="text" name="price" required class="form-control" id="price" value="">
                    </div>
                </div>
                <input hidden name="add">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-success">Add</button>
            </div>
        </form>
    </div>
</div>

<?php require_once '../include/footer.php' ?>


