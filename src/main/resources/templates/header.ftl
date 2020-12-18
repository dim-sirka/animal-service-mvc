<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
    body{
        bbackground: rgb(50,8,18);
        background: linear-gradient(0deg, rgba(50,8,18,1) 0%, rgba(198,197,197,1) 0%, rgba(190,190,190,1) 0%, rgba(43,27,38,1) 0%, rgba(255,253,200,1) 0%, rgba(215,192,157,1) 0%, rgba(251,251,251,1) 100%, rgba(157,133,36,1) 100%);
    }

    nav{
        background: rgb(50,8,18);
        background: linear-gradient(0deg, rgba(50,8,18,1) 0%, rgba(198,197,197,1) 0%, rgba(190,190,190,1) 0%, rgba(43,27,38,1) 0%, rgba(255,253,200,1) 0%, rgba(104,20,152,1) 0%, rgba(154,30,79,1) 100%, rgba(251,251,251,1) 100%);
    }

    .nav-item-color{
        color: #ffffff;
    }

    .card-item-img {
        height: 250px;
        width: 100%;
    }

    .card-item-img-info {
        height: 350px;
        width: 100%;
    }

    .font-family{
        font-family: 'KarollaC'
    }

    .zoom:hover {
        transform: scale(1.05);
        transition: transform .2s;
    }

    .dblclick-info-image:hover {
        transform: scale(2.00);
        transition: transform .2s;
    }

    .fa {
        font-size: 30px;
        width: 30px;
        height: 30px;
        text-align: center;
        text-decoration: none;

    }

    .fa:hover {
        opacity: 0.7;
    }

    .fa-facebook {
        /*margin: 5px 2px 0px 800px;*/
        /*background: #3B5998;*/
        color: white;
    }

    .fa-instagram {
        margin: 5px 2px;
        /*background: #125688;*/
        color: white;
    }

    .fa-logout{
        border:1px solid white;
        background: none;
        padding: 7px 15px;
        font-size: 17px;
        color:blue;

    }

</style>
<body>
<nav class="navbar navbar-expand-lg" style="background-color: #581845;">
    <div class="container">
        <div class="row justify-content-around">
            <div class="col-md-auto">
                <img src="https://cdn1.savepice.ru/uploads/2020/11/20/698671d079af0fa613934c3bca2a8228-full.png"
                     width="70" height="50" aria-hidden="true">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="col">
                <div class="navbar-nav">
                    <ul class="navbar-nav bd-navbar-nav flex-row">
                        <li class="nav-item">
                            <a class="nav-link nav-item-color" href="/" title="About us">Про нас</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-item-color active" href="/api/animals?animalStatus=FREE" title="">Віддаємо</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-item-color" href="/api/animals?animalStatus=TREATMENT" title="">Лікування</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-item-color" href="/api/animals?animalStatus=ARCHIVE" title="">Архів</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" style="color: white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Замовлення
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/list/orders">Замовлення</a>
                                <a class="dropdown-item" href="/list/archive_orders">Архів замовлень</a>
                            </div>
                        </li>
                    </ul>
                    <!-- Add font awesome icons -->
                </div>
            </div>
            <div class="col-4">
                    <a href="https://www.facebook.com/dimsirka/" class="fa fa-facebook" target="_blank"></a>
                    <a href="https://www.instagram.com/dim__sirka/?hl=ru" class="fa fa-instagram" target="_blank"></a>
                    <a href='/logout' class="fa-logout">LogOut</a>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row flex-xl-nowrap">
        <div class="col"></div>
            <div class="col-12">
