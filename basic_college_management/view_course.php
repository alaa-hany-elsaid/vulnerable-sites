<?php
ob_start();
include_once 'connection.php'; // connected
include_once 'navbar2.php';
$queryString = $connection->prepare("SELECT * FROM course where course_id =".$_GET['id']); //object
$queryString->execute();
$data = $queryString->fetchAll(PDO::FETCH_ASSOC); // array assoc
$query = $connection->prepare("SELECT * FROM course_comment where course_id =".$_GET['id']); //object
$query->execute();
$comments = $query->fetchAll(PDO::FETCH_ASSOC); // array assoc

?>
<div class="content">
            <div class="animated fadeIn">
            <div class="row">
                    <?php foreach ($data as $course){ ?>
                    <div class="col-lg-12">
                        <section class="card">
                            <div class="card-body text-secondary row" style="flex-direction: column;">
                                <div class="cource_img row-lg-6">
                                <img src="<?php echo $course['course_img']?>" alt="">
                                </div>
                                <div class="cource_name row-lg-2">
                                <p><?php echo $course['course_name']?></p>                                    
                                </div>
                                <div class="doctor_name row-lg-2">
                                <p>elon mask</p>                                    
                                </div>
                                <div class="cource_code row-lg-2">
                                <p><?php echo $course['course_code']?></p>                                    
                                </div>
                            </div>
                        </section>
                    </div>
                    <?php }?>
                </div>
            </div>
            <div class="row">
                    <?php 
                    foreach ($comments as $comment){ ?>
                    <div class="col-lg-12">
                        <section class="card">
                            <div class="card-body text-secondary row">
                                <div class="stu_id col">
                                <p><?php echo $comment['stu_id']?></p>                                    
                                </div>
                                <div class="cource_comment row-lg-2">
                                <p><?php echo $comment['comment']?></p>                                    
                                </div>
                            </div>
                        </section>
                    </div>
                    <?php }?>
                </div>
            </div>
        </div>

<?php
include_once 'footer.php';
ob_end_flush();
?>