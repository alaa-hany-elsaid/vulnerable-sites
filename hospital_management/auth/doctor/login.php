<?php
session_start();
if(isset($_SESSION['doctor]'])){
    header('Location: /pages/doctor/dashboard.php');
}
require_once('../../database/db.php');
require_once('../../helpers/functions.php');
//die(password_hash('hashem852', PASSWORD_DEFAULT));

if (($_SERVER['REQUEST_METHOD'] === 'POST') && isset($_POST['email']) && isset($_POST['password'])) {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $doctor = get_doctor_by_email($email);
    if ($doctor) {
        if (password_verify($password, $doctor['password'])) {
            $_SESSION['doctor'] = $doctor;
            header('Location: /pages/doctor/dashboard.php');
        } else {
            $error = 'كلمه السر غير صحيحه';
        }
    } else {
        $error = 'معلومات الدخول غير صحيحة';
    }
}
?><!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>تسجيل دخول </title>
    <?php include_once('../../includes/general/styles.php') ?>
    <link rel="stylesheet" href="/public/css/login.css">
    <link rel="stylesheet" href="/public/css/all.min.css"/>
</head>
<body>

<div class="container">
    <div class="wrapper">
        <div class="title"><span>تسجيل دخول الطبيب</span></div>
        <form method="post">
            <div class="row">
                <i class="fas fa-user"></i>
                <input name="email" type="text" placeholder="ادخل البريد الالكترونى" required>
            </div>
            <div class="row">
                <i class="fas fa-lock"></i>
                <input name="password" type="password" placeholder="ادخل الرقم السرى" required>
            </div>
            <!--            <div class="pass"><a href="#">هل نسيت الرقم السرى؟</a></div>-->
            <div class="row button">
                <input type="submit" value="دخول">
            </div>
        </form>
    </div>
</div>
<?php include_once('../../includes/general/scripts.php') ?>
<?php if (isset($error)) { ?>
<script>
    Swal.fire({
        icon: 'error',
        title: 'خطأ',
        text: '<?= $error ?>',
    })
</script>
<?php } ?>
</body>
</html>