<?php
//to-do push insert function to github
//to-do add stu login 
ob_start();
include_once 'connection.php'; // connected
include_once 'navbar2.php';
$queryString = $connection->prepare("SELECT * FROM course where course_id =".$_GET['id']); //object
$queryString->execute();
$data = $queryString->fetchAll(PDO::FETCH_ASSOC); // array assoc
if(!empty($_GET['id'])){
    $query = $connection->prepare("SELECT * FROM course_comment where course_id =".$_GET['id']); //object
    $query->execute();
    $comments = $query->fetchAll(PDO::FETCH_ASSOC); // array assoc
}
if(!empty($_GET['comment'])){
    $course_id=$_GET['id'];
    $comment=$_GET['comment'];
    // if(!isset($_SESSION['id'])){
    //     header("location: page-login.php");
    //     exit();
    // }
    $stu_id=$_SESSION['id'];
    $query = $connection->prepare("INSERT INTO `course_comment`(`course_id`, `stu_id`, `comment`) VALUES (?,?,?)"); //object
    $result = $query->execute([$course_id,$stu_id,$comment]);
    if ($result) {
        header("location: view_course.php?id=".$course_id);
        exit();
    }
}


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
            <div class="row">
                    <?php 
                    foreach ($comments as $comment){ ?>
                    <div class="col-lg-12">
                        <section class="card">
                            <div class="card-body text-secondary">
                                <div class="stu_name col">
                                <p><?php 
                                    // $query = $connection->prepare("SELECT stu_name FROM students WHERE id=".$comment['stu_id']); //object
                                    $query = $connection->prepare("SELECT username FROM admin WHERE id=".$comment['stu_id']); //object
                                    $query->execute();
                                    $stu_name = $query->fetch(PDO::FETCH_COLUMN);
                                    echo $stu_name;
                                    ?></p>                                    
                                </div>
                                <div class="cource_comment col-12">
                                <p><?php echo $comment['comment']?></p>                                    
                                </div>
                            </div>
                        </section>
                    </div>
                    <?php }?>
                </div>
            <div class="row">
                <form action="view_course.php?id=<?php echo $_GET['id']?>" method="get" class="col-12">
                    <div >
                        <section class="card">
                            <div class="card-body text-secondary">
                                <div class="comment col">
                                    <textarea name="comment" id="" cols="100" rows="2" style=" width: inherit;"></textarea>
                                    <input type="number" name="id" value="<?php echo $_GET['id']?>" style="display: none;">
                                </div>
                                <div class="add_cource_comment row-lg-2">
                                    <button type="submit" class="btn btn-primary me-2 col">add comment</button>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
</div>

<?php
include_once 'footer.php';
ob_end_flush();
?>