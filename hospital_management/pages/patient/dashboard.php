<!DOCTYPE html>
<html lang="ar">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>patient panel</title>

    <link href="/public/css/dashboard.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid">
    <!--Start header-->
    <div class="row header_section">
        <div class="col-sm-3 col-xs-12 logo_area bring_right">
            <h1 class="inline-block"><img src="img/logo.png" alt="">لوحة تحكم</h1>
            <span class="glyphicon glyphicon-align-justify bring_left open_close_menu" data-toggle="tooltip"
                  data-placement="right" title="Tooltip on left"></span>
        </div>

    </div>
    <div class=" col-sm-4 col-xs-12 user_header_area bring_left left_text"></div>
</div>
<!--/End header-->

<!--Start Side bar main menu-->
<div class="main_sidebar bring_right">
    <div class="main_sidebar_wrapper">
        <form class="form-inline search_box text-center">
            <div class="form-group"></div>
        </form>

        <ul>
            <li><span class="glyphicon glyphicon-home"></span><a href="<?= '' ?>">الصفحة الرئيسية</a></li>
            <li><span class="glyphicon  glyphicon-calendar"></span><a href="">السجل الطبى</a></li>
            <li><span class="glyphicon glyphicon-user"></span><a href="">الزيارات السابقة</a></li>
            <li><span class="glyphicon glyphicon-pencil"></span><a href="">تواصل مع طبيبك</a></li>
            <li><span class="glyphicon  glyphicon-calendar"></span><a href="">الروشتة</a></li>
            <li><span class="glyphicon glyphicon-phone"></span><a href="">التحاليل</a></li>
            <li><span class="glyphicon glyphicon-phone"></span><a href="">الأشعة</a></li>
            <li><span class="glyphicon glyphicon-cog"></span><a href="">الملف الشخصى</a></li>
        </ul>
    </div>
</div>
<!--/End side bar main menu-->

<!--Start Main content container-->
<div class="main_content_container">
    <div class="main_container  main_menu_open">
        <div class="page_content">
            <div class="page_content">
                <div class="home_statics text-center">
                    <h1 class="heading_title">احصائيات عامة للمريض</h1>

                    <div style="background-color: #34495e">
                        <span class="bring_right glyphicon glyphicon-user"></span>

                        <h3></h3>
                        <p class="h4"></p>
                    </div>

                    <div style="background-color: #34495e">
                        <span class="bring_right glyphicon glyphicon-phone-alt"></span>

                        <h3></h3>
                        <p class="h4"></p>
                    </div>
                    <div style="background-color: #34495e">
                        <span class="bring_right glyphicon glyphicon-calendar"></span>

                        <h3></h3>
                        <p class="h4"></p>
                    </div>
                    <div style="background-color: #34495e">
                        <span class="bring_right glyphicon glyphicon-pencil"></span>

                        <h3></h3>
                        <p class="h4"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/End Main content container-->


</div>
<!--/End body container section-->


<script src="/public/js/js.js"></script>
</body>

</html>