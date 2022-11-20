<?php
require_once '../../auth/doctor/auth.php';
require_once '../../database/db.php';
require_once '../../helpers/functions.php';

?><!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Doctor panel</title>
    <link href="/public/css/bootstrap.min.css" rel="stylesheet">
    <link href="/public/css/dashboard.css" rel="stylesheet">
    <link href="/public/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <!--Start header-->
    <div class="row header_section">
        <div class="col-sm-3 col-xs-12 logo_area bring_right">
            <h1 class="inline-block"><img src="/public/img/logo.png" alt="">لوحة تحكم</h1>
            <span class="glyphicon glyphicon-align-justify bring_left open_close_menu" data-toggle="tooltip"
                  data-placement="right" title="Tooltip on left"></span>
        </div>

    </div>
    <div class=" col-sm-4 col-xs-12 user_header_area bring_left left_text"></div>
</div>