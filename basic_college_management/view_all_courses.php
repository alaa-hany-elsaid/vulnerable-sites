<?php
ob_start();
include_once 'connection.php'; // connected
include_once 'navbar2.php';
$queryString = $connection->prepare("SELECT * FROM course"); //object
$queryString->execute();
$data = $queryString->fetchAll(PDO::FETCH_ASSOC); // array assoc

?>
<div class="content">
            <div class="animated fadeIn">

            <form action="view_all_cources.php" method="get">
                <section class="card">

                    <div class="row">
                        <div class="col-lg-8">
                                <div class="card-body text-secondary">
                                        <input type="text" name="search" id="" style="width:inherit;">
                                </div>
                        </div>
                        <div class="col-sm-2">
                                <div class="card-body text-secondary">
                                    <button type="submit" class='btn btn-primary me-2'>search</button>
                                </div>
                        </div>
                    </div>
                </section>

            </form>

                <?php if(isset($_GET['search'])){
                        $search = $_GET['search'];
                        // $search=str_replace( '<image', '', $search );
                        echo "search for ".$search;
                        $queryString = $connection->prepare("SELECT * from course where course_name like '%".$_GET['search']."%'"); //object
                        $queryString->execute();
                        $data = $queryString->fetchAll(PDO::FETCH_ASSOC); // array assoc
                    }?>
                <div class="row">
                    <?php foreach ($data as $course){ ?>
                    <div class="col-lg-6 row-lg-6">
                        <section class="card">
                            <div class="card-body text-secondary row" style="flex-direction: column;">
                                <div class="cource_img row-lg-6">
                                    <img src="<?php echo $course['course_img']?>" alt="">
                                </div>
                                <div class="cource_name row-lg-2">
                                    <p><?php echo $course['course_name']?></p>                                    
                                </div>
                                <div class="doctor_name row-lg-2">
                                    <p><?php 
                                    $query = $connection->prepare("SELECT name FROM doctores WHERE id=".$course['doc_id']); //object
                                    $query->execute();
                                    $doc_name = $query->fetch(PDO::FETCH_COLUMN);
                                    echo $doc_name;
                                    ?></p>                                    
                                </div>
                                <div class="cource_code row-lg-2">
                                    <p><?php echo $course['course_code']?></p>                                    
                                </div>
                                
                            </div>
                            <div class="cource_code row-lg-2">
                                    <input type="button" value="view" class="btn btn-primary me-2 col" id="btnHome" onClick="document.location.href='view_course.php?id=<?php echo $course['course_id']?>'" />
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