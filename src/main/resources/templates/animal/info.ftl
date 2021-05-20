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
<div class="main-card" style="background-color:white">
    <div class="row" style="margin-bottom: 15px">
        <div class="col" style="padding: 0;">
            <a href="/animals?animalStatus=${animal.animalStatus}" class="">
                <button class="btn btn-outline-dark" type="submit">Назад</button>
            </a>
        </div>
        <div class="col" style="text-align: right; padding: 0;">
            <@sec.authorize access="isAuthenticated()">
                <a href="/admin/animals/editForm/${animal.id}" class="" >
                    <button class="btn btn-outline-dark" type="submit">Редагувати тварину</button>
                </a>
            </@sec.authorize>
        </div>
    </div>
    <div class="container-fliud">
        <div class="wrapper row">
            <div class="col-md-6" style="padding-top: 15px;">
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
            </div>
            <div class="col-md-6" style="padding-left: 15px; padding-top: 15px;">
                <h3 class="product-title">${animal.name}</h3>
                <#if animal.animalStatus == "FREE">
                    <p id="labelForImg" style="background-color: #6f00cc; text-align: center;">
                        Шукає сім'ю</p>
                <#elseif animal.animalStatus == "TREATMENT">
                    <p id="labelForImg" style=" background-color: #ff0000; text-align: center;">
                        Потребує допомоги</p>
                <#elseif animal.animalStatus == "ARCHIVE">
                    <p id="labelForImg" style=" background-color: #6096d3; text-align: center;">
                        Влаштовано</p>
                </#if>
                <div class="rating">
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
                <div class="action">
                    <#if animal.animalStatus == "FREE">
                        <a href="/orders/new/${animal.id}" class="row justify-content-center">
                            <button class="add-to-cart btn btn-default" type="button">Створити замовлення</button>
                        </a>
                    <#elseif animal.animalStatus == "TREATMENT">
                        <a href="/" class="row justify-content-center">
                            <button class="add-to-cart btn btn-default" type="button">Пожертвувати</button>
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


<style>

    #labelForImg {
        background-color: #d38960;
        opacity: 0.8;
        font-size: 18px;
        width: 100%;
        color: #ffffff;
    }

    .list-item-id-unique {
        position: relative;
        background-color: #4a4a4a;
        color: #fff;
        padding: 3px 10px;
        font-size: 13px;
        text-align: center;
        margin-left: 80%;
    }
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

    .main-card {
        background: #eee;
        padding: 3em;
        line-height: 1.5em;
    }

    .card-body{
        padding: 0.7rem;
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

    function zoomPhoto() {
        var v = document.getElementById("info-image");
        v.className += "dblclick-info-image";
    }
</script>
<#include "../animal/footer.ftl">

