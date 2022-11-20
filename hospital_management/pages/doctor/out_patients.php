<?php
require_once '../../includes/doctor/header.php';
require_once '../../includes/doctor/slidebar.php';
?>
<!--Start Main content container-->
<div class="main_content_container">
    <div class="main_container  main_menu_open">
        <div class="page_content">
            <div class="page_content text-center">
                <h1 class="heading_title text-center">المرضي الخارجين</h1>
                <div style="padding: 20px; margin: 20px">
                    <table id="out_patients" class="display">
                        <thead>
                        <tr>
                            <th>الرقم التعريفي </th>
                            <th>out_prescrip_id </th>
                            <th>القسم </th>
                            <th>الطبيب</th>
                            <th>الاسم المريض </th>
                            <th>عدد الزيارات</th>
                            <th>التاريخ</th>
                            <th>الوقت</th>
                            <th>المدفوعات</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach (get_out_patients_by_doctor_id($_SESSION['doctor']['doctor_id']) as $out_patient){ ?>
                        <tr>
                            <th><?= $out_patient['out_patient_id'] ?> </th>
                            <th><?= $out_patient['out_prescrip_id'] ?> </th>
                            <th><?= $out_patient['department_name'] ?> </th>
                            <th><?= $out_patient['F_name'] . " " . $out_patient['M_name'] . " " . $out_patient['L_name']    ?> </th>
                            <th><?= $out_patient['F_pat_name'] . " " . $out_patient['M_pat_name'] . " " . $out_patient['L_pat_name']    ?> </th>
                            <th><?= $out_patient['visiting_no'] ?> </th>
                            <th><?= $out_patient['date'] ?> </th>
                            <th><?= $out_patient['time'] ?> </th>
                            <th><?= $out_patient['payment_val'] ?> </th>
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
        $('#out_patients').DataTable();
    });
</script>
</body>
</html>