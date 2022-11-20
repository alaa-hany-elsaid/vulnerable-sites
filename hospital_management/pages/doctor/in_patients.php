<?php
require_once '../../includes/doctor/header.php';
require_once '../../includes/doctor/slidebar.php';
?>
<!--Start Main content container-->
<div class="main_content_container">
    <div class="main_container  main_menu_open">
        <div class="page_content">
            <div class="page_content">
                <h1 class="heading_title text-center">المرضي الداخلين</h1>
                <div style="padding: 20px; margin: 20px">
                    <table id="in_patients" class="display">
                        <thead>
                        <tr>
                            <th>الرقم التعريفي</th>
                            <th>القسم</th>
                            <th>الطبيب</th>
                            <th> الممرضه</th>
                            <th>الاسم المريض</th>
                            <th>room_no</th>
                            <th>bed_no</th>
                            <th>admission_date</th>
                            <th>discharge_date</th>

                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach (get_in_patients_by_doctor_id($_SESSION['doctor']['doctor_id']) as $out_patient) { ?>
                            <tr>
                                <th><?= $out_patient['in_patient_id'] ?> </th>
                                <th><?= $out_patient['department_name'] ?> </th>
                                <th><?= $out_patient['F_name'] . " " . $out_patient['M_name'] . " " . $out_patient['L_name'] ?> </th>
                                <th><?= $out_patient['nurse_name'] ?> </th>
                                <th><?= $out_patient['in_F_name'] . " " . $out_patient['in_M_name'] . " " . $out_patient['in_L_name'] ?> </th>
                                <th><?= $out_patient['room_no'] ?> </th>
                                <th><?= $out_patient['bed_no'] ?> </th>
                                <th><?= $out_patient['admission_date'] ?> </th>
                                <th><?= $out_patient['discharge_date'] ?> </th>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    <!--/End Main content container-->


</div>
<?php
require_once '../../includes/doctor/footer.php';
?>
<script>
    $(document).ready(function () {
        $('#in_patients').DataTable();
    });
</script>
</body>
</html>
