<?php
ob_start();
include_once 'connection.php'; // connected
include_once 'navbar.php';
if (isset($_POST['save'])) {
    if (!empty($_POST['name']) && !empty($_POST['username']) && !empty($_POST['email']) && !empty($_POST['phone']) && !empty($_POST['password'])) {
        
        function validate($input)
        {
            $input = htmlspecialchars($input);
            $input = trim($input);
            return $input;
        }
        $name = $_POST['name'];
        $phone = $_POST['phone'];
        $email = $_POST['email'];
        $password = sha1($_POST['password']);
        $username = $_POST['username'];
        $is_admin = $_POST['is_admin'];

        $errors = [];
        if (empty($errors)) {
            try {
                $queryString = $connection->prepare("INSERT INTO `admin`(`id`,`name`, `username`, `password`, `email`, `phone`, `is_admin`) VALUES (?,?,?,?,?,?,?)");
                $result = $queryString->execute([NULL, $name, $username, $password, $email, $phone, $is_admin]);
                if ($result) {
                    header("location: all_students.php");
                    exit();
                }
            } catch (Exception $e) {
                echo "<div class='alert alert-danger'>" . $e->getMessage() . "</div>";
            }
        }
    } else {
        echo "<div class='alert alert-danger'>please fill the required fields</div>";
    }
}
?>
<div class="content">
    <div class="animated fadeIn">


        <div class="row">


            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <strong>Add Admin</strong>
                    </div>
                    <div class="card-body card-block">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">

                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Name</label></div>
                                <div class="col-12 col-md-9"><input type="text" id="text-input" name="name" placeholder="Enter the full name..." class="form-control"><small class="form-text text-muted"></small></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Username</label></div>
                                <div class="col-12 col-md-9"><input type="text" id="text-input" name="username" placeholder="Enter the a username..." class="form-control"><small class="form-text text-muted"></small></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">password</label></div>
                                <div class="col-12 col-md-9"><input type="password" id="text-input" name="password" placeholder="Enter a Password" class="form-control"><small class="form-text text-muted"></small></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Email</label></div>
                                <div class="col-12 col-md-9"><input type="email" id="email-input" name="std_email" placeholder="Enter Email" class="form-control"><small class="help-block form-text" style="color:red;"><?php if (isset($errors['email'])) {
                                                                                                                                                                                                                                echo $errors['email'];
                                                                                                                                                                                                                            } ?></small></div>
                            </div>
                            
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Phone</label></div>
                                <div class="col-12 col-md-9"><input type="text" id="text-input" name="phone" placeholder="Enter a phone number" class="form-control"><small class="form-text text-muted"></small></div>
                            </div>

                           <div class="row form-group">
                                <div class="col col-md-3"><label for="select" class=" form-control-label">Full Admin</label></div>
                                <div class="col-12 col-md-9">
                                    <select name="is_admin" id="select" class="form-control">
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>

                        
                            <!-- <div class="row form-group">
                                <div class="col col-md-3"><label for="select" class=" form-control-label">City</label></div>
                                <div class="col-12 col-md-9">
                                    <select name="select" id="select" class="form-control">
                                        <option value="0">Please select</option>
                                        <option value="1">Option #1</option>
                                        <option value="2">Option #2</option>
                                        <option value="3">Option #3</option>
                                    </select>
                                </div>
                            </div> -->
                            <div class="card-footer">
                                <input type="submit" value="save" name="save" class="btn btn-secondary">
                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>


    </div><!-- .animated -->
</div><!-- .content -->

<div class="clearfix"></div>
<?php
include_once 'footer.php';
ob_end_flush();
?>