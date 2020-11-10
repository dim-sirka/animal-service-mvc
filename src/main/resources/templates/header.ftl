<html>
<head>
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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


</style>
<body>
<nav class="navbar navbar-expand-lg" style="background-color: #581845;">

<#--    <img src="https://lh4.googleusercontent.com/vZLFgGVrHqK_sYXaWPW-0ZRq73L8lmXB_BOqIjChO4OEcNM4fksGI5AEotJxAbowFv3Dbi_0cNTc0QHZbpnB=w1915-h850-rw" width="70" height="50" class="d-inline-block align-top" alt="">-->
<#--    -->
    <img src="https://lh4.googleusercontent.com/vZLFgGVrHqK_sYXaWPW-0ZRq73L8lmXB_BOqIjChO4OEcNM4fksGI5AEotJxAbowFv3Dbi_0cNTc0QHZbpnB=w1915-h850-rw"
         width="70" height="50" aria-hidden="true">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

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
        </ul>
        <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
            <li class="nav-item">
                <a class="nav-link p-2" href="https://github.com/twbs/bootstrap" target="_blank" rel="nofollow noopener" aria-label="GitHub" title="GitHub">
                    <svg class="navbar-nav-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 499.36" focusable="false"><title>GitHub</title><path d="M256 0C114.64 0 0 114.61 0 256c0 113.09 73.34 209 175.08 242.9 12.8 2.35 17.47-5.56 17.47-12.34 0-6.08-.22-22.18-.35-43.54-71.2 15.49-86.2-34.34-86.2-34.34-11.64-29.57-28.42-37.45-28.42-37.45-23.27-15.84 1.73-15.55 1.73-15.55 25.69 1.81 39.21 26.38 39.21 26.38 22.84 39.12 59.92 27.82 74.5 21.27 2.33-16.54 8.94-27.82 16.25-34.22-56.84-6.43-116.6-28.43-116.6-126.49 0-27.95 10-50.8 26.35-68.69-2.63-6.48-11.42-32.5 2.51-67.75 0 0 21.49-6.88 70.4 26.24a242.65 242.65 0 0 1 128.18 0c48.87-33.13 70.33-26.24 70.33-26.24 14 35.25 5.18 61.27 2.55 67.75 16.41 17.9 26.31 40.75 26.31 68.69 0 98.35-59.85 120-116.88 126.32 9.19 7.9 17.38 23.53 17.38 47.41 0 34.22-.31 61.83-.31 70.23 0 6.85 4.61 14.81 17.6 12.31C438.72 464.97 512 369.08 512 256.02 512 114.62 397.37 0 256 0z" fill="currentColor" fill-rule="evenodd"></path></svg>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link p-2" href="https://twitter.com/getbootstrap" target="_blank" rel="nofollow noopener" aria-label="Twitter" title="Twitter">
                    <svg class="navbar-nav-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 416.32" focusable="false"><title>Twitter</title><path d="M160.83 416.32c193.2 0 298.92-160.22 298.92-298.92 0-4.51 0-9-.2-13.52A214 214 0 0 0 512 49.38a212.93 212.93 0 0 1-60.44 16.6 105.7 105.7 0 0 0 46.3-58.19 209 209 0 0 1-66.79 25.37 105.09 105.09 0 0 0-181.73 71.91 116.12 116.12 0 0 0 2.66 24c-87.28-4.3-164.73-46.3-216.56-109.82A105.48 105.48 0 0 0 68 159.6a106.27 106.27 0 0 1-47.53-13.11v1.43a105.28 105.28 0 0 0 84.21 103.06 105.67 105.67 0 0 1-47.33 1.84 105.06 105.06 0 0 0 98.14 72.94A210.72 210.72 0 0 1 25 370.84a202.17 202.17 0 0 1-25-1.43 298.85 298.85 0 0 0 160.83 46.92" fill="currentColor"></path></svg>

                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link p-2" href="https://bootstrap-slack.herokuapp.com" target="_blank" rel="nofollow noopener" aria-label="Slack" title="Slack">
                    <svg class="navbar-nav-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" focusable="false"><title>Slack</title><path fill="currentColor" d="M210.787 234.832l68.31-22.883 22.1 65.977-68.309 22.882z"></path><path d="M490.54 185.6C437.7 9.59 361.6-31.34 185.6 21.46S-31.3 150.4 21.46 326.4 150.4 543.3 326.4 490.54 543.34 361.6 490.54 185.6zM401.7 299.8l-33.15 11.05 11.46 34.38c4.5 13.92-2.87 29.06-16.78 33.56-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18l-11.46-34.38-68.36 22.92 11.46 34.38c4.5 13.92-2.87 29.06-16.78 33.56-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18l-11.46-34.43-33.15 11.05c-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18c-4.5-13.92 2.87-29.06 16.78-33.56l33.12-11.03-22.1-65.9-33.15 11.05c-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18c-4.48-13.93 2.89-29.07 16.81-33.58l33.15-11.05-11.46-34.38c-4.5-13.92 2.87-29.06 16.78-33.56s29.06 2.87 33.56 16.78l11.46 34.38 68.36-22.92-11.46-34.38c-4.5-13.92 2.87-29.06 16.78-33.56s29.06 2.87 33.56 16.78l11.47 34.42 33.15-11.05c13.92-4.5 29.06 2.87 33.56 16.78s-2.87 29.06-16.78 33.56L329.7 194.6l22.1 65.9 33.15-11.05c13.92-4.5 29.06 2.87 33.56 16.78s-2.88 29.07-16.81 33.57z" fill="currentColor"></path></svg>
                </a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row flex-xl-nowrap">
        <div class="col"></div>
            <div class="col-12">