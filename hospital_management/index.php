<!doctype html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <?php include_once __DIR__ . '/includes/general/styles.php' ?>
    <title>مستشفي </title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6 ">
            <div class="w-100 mt-5 d-flex  justify-content-evenly">
                <a href="/auth/doctor/login.php" class="btn btn-primary "> تسجيل كطبيب </a>
                <a href="/auth/patient/login.php" class="btn btn-primary "> تسجيل كمريض </a>
            </div>
        </div>
    </div>
</div>
<?php include_once __DIR__ . '/includes/general/scripts.php' ?>
</body>
</html>