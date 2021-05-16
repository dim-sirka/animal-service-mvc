<#include "../animal/header.ftl">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<div class="title title_size_medium  position_center "
     style="background-size: 1920px; background-image: url(&quot;http://i.piccy.info/i9/d51e5163edafc54bdc11e474fcedf41a/1620396750/59417/1428203/friends_1149841_1920darkBlured.jpg&quot;); height: 373px; background-position: center -75.1968px;">
    <div class="title_holder" style="padding-top:85px;height:288px;">
        <div class="container">
            <div class="container_inner clearfix">
                <div class="title_subtitle_holder">
                    <div class="title_subtitle_holder_inner">
                        <h1><span>Повна інформація про тварину</span></h1>
                        <span class="subtitle"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


<div class="card mb-2">
    <div class="row"
         style="margin: 15px 25px;">
        <div class="col md-6">
            <a href="/animals?animalStatus=${animal.animalStatus}" class="row ml-1">
                <button class="btn btn-secondary text-center" type="submit">Назад</button>
            </a>
        </div>
        <div class="col md-6">
            <@sec.authorize access="isAuthenticated()">
                <a href="/admin/animals/editForm/${animal.id}" class="row ml-1" style="text-align: right;">
                    <button class="btn btn-secondary text-center" type="submit">Редагувати тварину</button>
                </a>
            </@sec.authorize>
        </div>
    </div>
    <div class="container-fliud">
        <div class="wrapper row">
            <div class="preview col-md-6">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <#list animal.mediaLinks as link>
                            <li data-target="#carouselExampleIndicators" data-slide-to="${link_index}"
                                class="${(link?counter == 1)?then('active', '')}">
                                >
                            </li>
                        </#list>
                    </ol>
                    <div class="carousel-inner">
                        <#list animal.mediaLinks as link>
                            <div class="carousel-item ${(link?counter == 1)?then('active', '')}">
                                <img class="card-img-top card-item-img-info" id="info-image" src="${link}">
                            </div>
                        </#list>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="row">
                    <div class="column">
                        <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/11/adopt-1.jpg"
                             style="width:100%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
                    </div>
                    <div class="column">
                        <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/11/adopt-2.jpg"
                             style="width:100%" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
                    </div>
                    <div class="column">
                        <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/11/adopt-3.jpg"
                             style="width:100%" onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
                    </div>
                    <div class="column">
                        <img src="img_lights.jpg" style="width:100%" onclick="openModal();currentSlide(4)"
                             class="hover-shadow cursor">
                    </div>
                </div>
                <div id="myModal" class="modal">
                    <span class="close cursor" onclick="closeModal()">&times;</span>
                    <div class="modal-content">

                        <div class="mySlides">
                            <div class="numbertext">1 / 4</div>
                            <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/11/adopt-1.jpg"
                                 style="width:100%">
                        </div>

                        <div class="mySlides">
                            <div class="numbertext">2 / 4</div>
                            <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/11/adopt-2.jpg"
                                 style="width:100%">
                        </div>

                        <div class="mySlides">
                            <div class="numbertext">3 / 4</div>
                            <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/11/adopt-3.jpg"
                                 style="width:100%">
                        </div>

                        <div class="mySlides">
                            <div class="numbertext">4 / 4</div>
                            <img src="img_lights_wide.jpg" style="width:100%">
                        </div>

                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>

                        <#--                        <div class="caption-container">-->
                        <#--                            <p id="caption"></p>-->
                        <#--                        </div>-->
                        <#--                        <div class="column">-->
                        <#--                            <img class="demo cursor" src="img_nature_wide.jpg" style="width:100%"-->
                        <#--                                 onclick="currentSlide(1)" alt="Nature and sunrise">-->
                        <#--                        </div>-->
                        <#--                        <div class="column">-->
                        <#--                            <img class="demo cursor" src="img_snow_wide.jpg" style="width:100%"-->
                        <#--                                 onclick="currentSlide(2)" alt="Snow">-->
                        <#--                        </div>-->
                        <#--                        <div class="column">-->
                        <#--                            <img class="demo cursor" src="img_mountains_wide.jpg" style="width:100%"-->
                        <#--                                 onclick="currentSlide(3)" alt="Mountains and fjords">-->
                        <#--                        </div>-->
                        <#--                        <div class="column">-->
                        <#--                            <img class="demo cursor" src="img_lights_wide.jpg" style="width:100%"-->
                        <#--                                 onclick="currentSlide(4)" alt="Northern Lights">-->
                        <#--                        </div>-->
                    </div>
                </div>
            </div>
            <div class="details col-md-6">
                <h3 class="product-title">${animal.name}</h3>
                <div class="rating">
                    <div class="stars">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>
                    <span class="review-no">${animal.visitCounter} переглядів</span>
                </div>


                <p class="product-description">${animal.description}</p>
                <table class="table table-hover mb-0" style="text-align: left">
                    <tbody>
                    <tr>
                        <th class="align-middle" scope="row">Вік:</th>
                        <td class="td-padding">${animal.age}</td>
                    </tr>
                    <tr>
                        <th class="align-middle" scope="row">Вид:</th>
                        <td class="td-padding">${animal.animalType}</td>
                    </tr>
                    <tr>
                        <th class="align-middle" scope="row">Дата створення:</th>
                        <td class="td-padding">${animal.createdDate}</td>
                    </tr>
                    <tr>
                        <th class="align-middle" scope="row">Статус:</th>
                        <td class="td-padding">${animal.animalStatus}</td>
                    </tr>
                    </tbody>
                </table>

                <#--            <h5>Вік:${animal.age}</h5>-->
                <#--            <h5>Вид:${animal.animalType}</h5>-->
                <#--            <h5>Дата додавання:${animal.createdDate}</h5>-->
                <#--            <h5>Статус:${animal.animalStatus}</h5>-->
                <div class="action">
                    <#if animal.animalStatus == "FREE">
                        <a href="/orders/new/${animal.id}" class="row justify-content-center">
                            <button class="add-to-cart btn btn-default" type="button">Створити замовлення</button>
                        </a>
                    <#elseif animal.animalStatus == "TREATMENT">
                    <#--Make payment by means of googlePay-->
                        <a href="/" class="row justify-content-center">
                            <button class="add-to-cart btn btn-default" type="button">Пожертвувати</button>
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>



<style>
    img {
        max-width: 100%;
    }

    .preview {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
    }

    @media screen and (max-width: 996px) {
        .preview {
            margin-bottom: 20px;
        }
    }

    .preview-pic {
        -webkit-box-flex: 1;
        -webkit-flex-grow: 1;
        -ms-flex-positive: 1;
        flex-grow: 1;
    }

    .preview-thumbnail.nav-tabs {
        border: none;
        margin-top: 15px;
    }

    .preview-thumbnail.nav-tabs li {
        width: 18%;
        margin-right: 2.5%;
    }

    .preview-thumbnail.nav-tabs li img {
        max-width: 100%;
        display: block;
    }

    .preview-thumbnail.nav-tabs li a {
        padding: 0;
        margin: 0;
    }

    .preview-thumbnail.nav-tabs li:last-of-type {
        margin-right: 0;
    }

    .tab-content {
        overflow: hidden;
    }

    .tab-content img {
        width: 100%;
        -webkit-animation-name: opacity;
        animation-name: opacity;
        -webkit-animation-duration: .3s;
        animation-duration: .3s;
    }

    .card {
        background: #eee;
        padding: 3em;
        line-height: 1.5em;
    }


    .details {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
    }

    .colors {
        -webkit-box-flex: 1;
        -webkit-flex-grow: 1;
        -ms-flex-positive: 1;
        flex-grow: 1;
    }

    .product-title, .price, .sizes, .colors {
        text-transform: UPPERCASE;
        font-weight: bold;
    }

    .checked, .price span {
        color: #ff9f1a;
    }

    .product-title, .rating, .product-description, .price, .vote, .sizes {
        margin-bottom: 15px;
    }

    .product-title {
        margin-top: 0;
    }

    .size {
        margin-right: 10px;
    }

    .size:first-of-type {
        margin-left: 40px;
    }

    .color {
        display: inline-block;
        vertical-align: middle;
        margin-right: 10px;
        height: 2em;
        width: 2em;
        border-radius: 2px;
    }

    .color:first-of-type {
        margin-left: 20px;
    }

    .add-to-cart, .like {
        background: #ff9f1a;
        padding: 1.2em 1.5em;
        border: none;
        text-transform: UPPERCASE;
        font-weight: bold;
        color: #fff;
        -webkit-transition: background .3s ease;
        transition: background .3s ease;
    }

    .add-to-cart:hover, .like:hover {
        background: #b36800;
        color: #fff;
    }

    .not-available {
        text-align: center;
        line-height: 2em;
    }

    .not-available:before {
        font-family: fontawesome;
        content: "\f00d";
        color: #fff;
    }

    .orange {
        background: #ff9f1a;
    }

    .green {
        background: #85ad00;
    }

    .blue {
        background: #0076ad;
    }

    .tooltip-inner {
        padding: 1.3em;
    }

    @-webkit-keyframes opacity {
        0% {
            opacity: 0;
            -webkit-transform: scale(3);
            transform: scale(3);
        }
        100% {
            opacity: 1;
            -webkit-transform: scale(1);
            transform: scale(1);
        }
    }

    @keyframes opacity {
        0% {
            opacity: 0;
            -webkit-transform: scale(3);
            transform: scale(3);
        }
        100% {
            opacity: 1;
            -webkit-transform: scale(1);
            transform: scale(1);
        }
    }

    body {
        font-family: Verdana, sans-serif;
        margin: 0;
    }

    * {
        box-sizing: border-box;
    }

    .row > .column {
        padding: 0 8px;
    }

    .row:after {
        content: "";
        display: table;
        clear: both;
    }

    .column {
        float: left;
        width: 25%;
    }

    /* The Modal (background) */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        padding-top: 100px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: black;
    }

    /* Modal Content */
    .modal-content {
        position: relative;
        background-color: #fefefe;
        margin: auto;
        padding: 0;
        width: 90%;
        max-width: 1200px;
    }

    /* The Close Button */
    .close {
        color: white;
        position: absolute;
        top: 10px;
        right: 25px;
        font-size: 35px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #999;
        text-decoration: none;
        cursor: pointer;
    }

    .mySlides {
        display: none;
    }

    .cursor {
        cursor: pointer;
    }

    /* Next & previous buttons */
    .prev,
    .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -50px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
        -webkit-user-select: none;
    }

    /* Position the "next button" to the right */
    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    /* On hover, add a black background color with a little bit see-through */
    .prev:hover,
    .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    /* Number text (1/3 etc) */
    .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
    }

    img {
        margin-bottom: -4px;
    }

    .caption-container {
        text-align: center;
        background-color: black;
        padding: 2px 16px;
        color: white;
    }

    .demo {
        opacity: 0.6;
    }

    .active,
    .demo:hover {
        opacity: 1;
    }

    img.hover-shadow {
        transition: 0.3s;
    }

    .hover-shadow:hover {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
</style>
<script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        captionText.innerHTML = dots[slideIndex - 1].alt;
    }

    function zoomPhoto() {
        var v = document.getElementById("info-image");
        v.className += "dblclick-info-image";
    }
</script>
<#include "../animal/footer.ftl">

