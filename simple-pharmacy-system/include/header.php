<!DOCTYPE html>
<html >
<head>
    <title> <?php echo $title ?> </title>
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fonts/font-awesome/css/font-awesome.min.css">
    <script src='/assets/js/jquery.js' ></script>
    <script src='/assets/js/bootstrap.bundle.min.js'></script>

</head>
<body   style="background-color: #4f5050">
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link <?php if($title == "Home") echo "active" ?>" href="/index.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?php if($title == "Clients") echo "active" ?>" href="/clients/index.php">Clients</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?php if($title == "Medicines") echo "active" ?>" href="/medicines/index.php">Medicines</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?php if($title == "Invoices") echo "active" ?>" href="/invoices/index.php">Invoices</a>
                </li>


            </ul>
            <ul class="navbar-nav d-flex">
                <li class="nav-item">
                    <a class="nav-link  <?php if($title == "Profile") echo "active" ?> " href="/auth/profile.php">
                        <i class="fa fa-user-circle"></i>
                        Profile
                    </a>
                </li>
                <li class="nav-item d-flex">
                    <a class="nav-link" href="/auth/logout.php">
                        <i class="fa fa-sign-out"></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>



