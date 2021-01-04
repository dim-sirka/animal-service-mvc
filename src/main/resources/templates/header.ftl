<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"]/>

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
        /*margin: 5px 2px 0px 1250px;*/
        color: white;
    }

    .fa-instagram {
        /*margin: 5px 2px;*/
        color: white;
    }

</style>
<body>
<nav class="navbar justify-content-between" style="background-color: #581845;">

    <img src="https://i.ibb.co/5v4Sb84/dim-sirka.png"
         width="70" height="70" aria-hidden="true">

        <ul class="navbar-nav bd-navbar-nav flex-row" style="margin: 15px 30px;">
            <li class="nav-item" >
                <a class="nav-link nav-item-color" href="/" title="About us" style="margin: 0 20px;">Про нас</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-item-color active" href="/animals?animalStatus=FREE" style="margin: 0 20px;">Віддаємо</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-item-color" href="/animals?animalStatus=TREATMENT" style="margin: 0 20px;">Лікування</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-item-color" href="/animals?animalStatus=ARCHIVE" style="margin: 0 20px;">Архів</a>
            </li>
            <@sec.authorize access="isAuthenticated()">
                <li class="nav-item dropdown" >
                    <a class="nav-link dropdown-toggle" style="color: white; margin: 0 20px;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Замовлення
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/list/orders">Замовлення</a>
                        <a class="dropdown-item" href="/list/archive_orders">Архів замовлень</a>
                    </div>
                </li>
            </@sec.authorize>
        </ul>

    <form class="form-inline my-5 my-lg-0" action="/logout" method="get">
        <a href="https://www.facebook.com/dimsirka/" class="fa fa-facebook" target="_blank" style="margin: 5px 2px;"></a>
        <a href="https://www.instagram.com/dim__sirka/?hl=ru" class="fa fa-instagram" target="_blank" style="margin: 5px 2px;"></a>
        <@sec.authorize access="isAuthenticated()">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin: 15px 10px;">Вихід</button>
        </@sec.authorize>
    </form>
</nav>
<div class="container">
    <div class="row flex-xl-nowrap">
        <div class="col"></div>
            <div class="col-12">
