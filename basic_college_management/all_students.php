<?php
include_once 'connection.php'; // connected
include_once 'navbar.php';
$queryString = $connection->prepare("SELECT * FROM students"); //object
$queryString->execute();
$data = $queryString->fetchAll(PDO::FETCH_ASSOC); // array assoc

// $data = [
//     ["std_name" => "hany", "std_phone" => "0223332"],
//     ["std_name" => "samy", "std_phone" => "010000"]
// ];
?>
<div class="breadcrumbs">
    <div class="breadcrumbs-inner">
        <div class="row m-0">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Students</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="all_students.php">All Students</a></li>
                            <li><a href="add_student.php">Add New Student</a></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <div class="animated fadeIn">
        <div class="row">

            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <strong class="card-title">Students</strong>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">name</th>
                                    <th scope="col">phone</th>
                                    <th scope="col">email</th>
                                    <th scope="col">address</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- start looping -->
                                <?php foreach ($data as $value) { ?>
                                    <tr>
                                        <th scope="row"><?php echo $value['id']; ?></th>
                                        <td><?php echo $value['stu_name']; ?></td>
                                        <td><?php echo $value['stu_phone']; ?></td>
                                        <td><?php echo $value['stu_mail']; ?></td>
                                        <td><?php echo $value['stu_address']; ?></td>
                                    </tr>
                                <?php } ?>
                                <!-- end looping -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div><!-- .animated -->
</div><!-- .content -->

<div class="clearfix"></div>
<?php
include_once 'footer.php';
?>