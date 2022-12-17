<?php
ob_start();
include_once 'connection.php'; // connected
include_once 'navbar.php';
if (isset($_POST['save'])) {
    if (!empty($_POST['std_name']) && !empty($_POST['std_phone']) && !empty($_POST['std_email']) && !empty($_POST['std_address'])) {
        $errors = [];
        function validate($input)
        {
            $input = htmlspecialchars($input);
            $input = trim($input);
            return $input;
        }
        $std_name = validate($_POST['std_name']);
        $std_phone = validate($_POST['std_phone']);
        $std_email = validate($_POST['std_email']);
        $std_address = /*validate(*/$_POST['std_address'];//);
        //simple payload: <script>alert(1);</script>

        if (!filter_var($std_email, FILTER_VALIDATE_EMAIL)) {
            $errors['email'] = "please enter valid email";
        }
        if (empty($errors)) {
            try {
                $queryString = $connection->prepare("INSERT INTO `students`(`stu_name`, `stu_phone`, `stu_mail`, `stu_address`) VALUES (?,?,?,?)");
                $result = $queryString->execute([$std_name, $std_phone, $std_email, $std_address]);
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
                        <strong>Add Student</strong>
                    </div>
                    <div class="card-body card-block">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">

                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Name</label></div>
                                <div class="col-12 col-md-9"><input type="text" id="text-input" name="std_name" placeholder="Text" class="form-control"><small class="form-text text-muted"></small></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Phone</label></div>
                                <div class="col-12 col-md-9"><input type="text" id="text-input" name="std_phone" placeholder="Text" class="form-control"><small class="form-text text-muted"></small></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Email</label></div>
                                <div class="col-12 col-md-9"><input type="email" id="email-input" name="std_email" placeholder="Enter Email" class="form-control"><small class="help-block form-text" style="color:red;"><?php if (isset($errors['email'])) {
                                                                                                                                                                                                                                echo $errors['email'];
                                                                                                                                                                                                                            } ?></small></div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Address</label></div>
                                <div class="col-12 col-md-9"><textarea name="std_address" id="textarea-input" rows="9" placeholder="Content..." class="form-control"></textarea></div>
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