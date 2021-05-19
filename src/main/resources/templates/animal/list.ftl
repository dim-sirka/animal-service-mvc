<#include "header.ftl">

<div class="title title_size_medium  position_center "
     style="background-size: 1920px; background-image: url(&quot;http://i.piccy.info/i9/d51e5163edafc54bdc11e474fcedf41a/1620396750/59417/1428203/friends_1149841_1920darkBlured.jpg&quot;); height: 373px; background-position: center -75.1968px;">
    <div class="title_holder" style="padding-top:85px;height:288px;">
        <div class="container">
            <div class="container_inner clearfix">
                <div class="title_subtitle_holder">
                    <div class="title_subtitle_holder_inner">
                        <#assign pageSubmissionUrl = animalStatus???then('&animalStatus=${animalStatus}','') >
                        <#if animals.content[0].animalStatus == "FREE">
                            <h1><span>Не купуй - візьми!</span></h1>
                            <span class="subtitle">Адже це дуже важливо.</span>
                        <#elseif animals.content[0].animalStatus == "TREATMENT">
                            <h1><span>Нам потрібна ваша підтримка!</span></h1>
                            <span class="subtitle">Не залишайся байдужим.</span>
                        <#elseif animals.content[0].animalStatus == "ARCHIVE">
                            <h1><span>Архів</span></h1>
                            <span class="subtitle">Тварини, які вже знайшли нових власників</span>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

<#if animals.totalPageNumber != 0 >
    <div style="margin-bottom: 5%">
        <div class="container pt-5">
            <div class="row">
                <div class="col-md-8 order-md-2 col-lg-9">
                    <div class="container-fluid">
                        <div class="row   mb-5">
                            <div class="col-12">
                                <div class="dropdown text-md-left text-center float-md-left mb-3 mt-3 mt-md-0 mb-md-0">
                                    <label class="mr-2">Сортувати за:</label>
                                    <a class="btn btn-lg btn-light dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false">Датою додавання <span
                                                class="caret"></span></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown"
                                         x-placement="bottom-start"
                                         style="position: absolute; transform: translate3d(71px, 48px, 0px); top: 0px; left: 0px; will-change: transform;">
                                        <a class="dropdown-item" href="#">Датою додавання</a>
                                        <a class="dropdown-item" href="#">Віком</a>
                                        <a class="dropdown-item" href="#">Розміром</a>
                                    </div>
                                </div>
                                <div class="btn-group float-md-right ml-3">
                                    <button type="button" class="btn btn-lg btn-light"><span
                                                class="fa fa-arrow-left"></span></button>
                                    <button type="button" class="btn btn-lg btn-light">7</button>
                                    <button type="button" class="btn btn-lg btn-light"><span
                                                class="fa fa-arrow-right"></span></button>
                                </div>
                            </div>
                        </div>
                        <@sec.authorize access="isAuthenticated()">
                            <div class="wpcf7-form-control wpcf7-submit"
                                 style="margin: 15px 25px; text-align: right;">
                                <a role="button" class="btn btn-outline-dark" href="/admin/animals/create">Додати
                                    тварину</a>
                            </div>
                        </@sec.authorize>
                        <div class="container">
                            <div class="row">
                                <#list animals.content as animal>
                                    <div class="col-md-6" >
                                        <div class="vc_column-inner">
                                            <div class="wpb_wrapper">
                                                <div class="qode-specification-list">
                                                    <#if animals.content[0].animalStatus == "FREE">
                                                        <p id="labelForImg" style="background-color: #6f00cc; text-align: center; margin-bottom: -25px">
                                                            Шукає сім'ю</p>
                                                    <#elseif animals.content[0].animalStatus == "TREATMENT">
                                                        <p id="labelForImg" style=" background-color: #ff0000; text-align: center; margin-bottom: -25px">
                                                            Потребує допомоги</p>
                                                    <#elseif animals.content[0].animalStatus == "ARCHIVE">
                                                        <p id="labelForImg" style=" background-color: #6096d3; text-align: center; margin-bottom: -25px">
                                                            Влаштовано</p>
                                                    </#if>
                                                    <div class="qode-specification-list-image">
                                                        <a href="/animals/${animal.id}">
                                                            <#if animal.mediaLinks??>
                                                                <img class="card-img-top card-item-img"
                                                                     style="visibility: visible;"
                                                                     src="${animal.mediaLinks[0]}"
                                                                >
                                                            <#else>
                                                                <img class="card-img-top card-item-img"
                                                                     style="visibility: visible;"
                                                                     src="https://pixy.org/src/120/1206832.jpg"
                                                                >
                                                            </#if>
                                                        </a>
                                                    </div>
                                                    <p id="visitCounter">
                                                        <i class="fa fa-eye"
                                                           style="font-size: 18px; color: #f8f9fa">${animal.visitCounter}</i>
                                                    </p>
                                                    <div class="list-item-id-unique">
                                                        ID ${animal.id}
                                                    </div>
                                                    <div class="qode-specification-list-text-holder">
                                                        <h4 class="qode-specification-list-title">
                                                            ${animal.name} </h4>
                                                        <div class="qode-specification-list-items">
                                                            <div class="qode-specification-list-item">
                                                <span class="qode-specification-list-item-label">
                                                Тип </span>
                                                                <span class="qode-specification-list-item-value">
                                                    ${animal.animalType} </span>
                                                            </div>
                                                            <div class="qode-specification-list-item">
                                                <span class="qode-specification-list-item-label">
                                                Стать </span>
                                                                <span class="qode-specification-list-item-value">
                                                    Female </span>
                                                            </div>
                                                            <div class="qode-specification-list-item">
                                                <span class="qode-specification-list-item-label">
                                                Вік </span>
                                                                <span class="qode-specification-list-item-value">
                                                    ${animal.age} </span>
                                                            </div>
                                                            <div class="qode-specification-list-item">
                                                <span class="qode-specification-list-item-label">
                                                Стерилізована </span>
                                                                <span class="qode-specification-list-item-value">
                                                    Yes </span>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="qode-specification-list-holder">
                                                        <#if animal.animalStatus == "FREE">
                                                            <a itemprop="url"
                                                               class="qode-qbutton-main-color qode-qbutton-full-width qode-qbutton-square"
                                                               href="/orders/new/${animal.id}"
                                                               target="_self"
                                                               style="background-color:#9aa0b0;height:84px;line-height:84px"><span>Створити замовлення</span></a>
                                                        <#elseif animal.animalStatus == "TREATMENT">
                                                            <a itemprop="url"
                                                               class="qode-qbutton-main-color qode-qbutton-full-width qode-qbutton-square"
                                                               href="/"
                                                               target="_self"
                                                               style="background-color:#9aa0b0;height:84px;line-height:84px"><span>Пожертвувати</span></a>
                                                        </#if>
                                                    </div>
                                                </div>
                                                <div class="vc_empty_space" style="height: 37px"><span
                                                            class="vc_empty_space_inner">
                                                <span class="empty_space_image"></span>
                                                </span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <#if animal?counter%2 == 0>
                                        <div class="w-100"></div>
                                    </#if>
                                </#list>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 order-md-1 col-lg-3 sidebar-filter">
                    <h3 class="mt-0 mb-5">Налаштування</h3>
                    <h6 class="text-uppercase font-weight-bold mb-3">Стать тварини</h6>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="gender-1" name="gender">
                            <label class="custom-control-label" for="gender-1">Хлопчик</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="gender-2" name="gender">
                            <label class="custom-control-label" for="gender-2">Дівчинка</label>
                        </div>
                    </div>
                    <div class="divider mt-5 mb-5 border-bottom border-secondary"></div>
                    <h6 class="text-uppercase mt-5 mb-3 font-weight-bold">Вік тварини</h6>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="age-1" name="age">
                            <label class="custom-control-label" for="age-1">До одного року</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="age-2" name="age">
                            <label class="custom-control-label" for="age-2">1-2 роки</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="age-3" name="age">
                            <label class="custom-control-label" for="age-3">2-3 роки</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="age-4" name="age">
                            <label class="custom-control-label" for="age-4">3-4 роки</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="age-5" name="age">
                            <label class="custom-control-label" for="age-5">5 і більше років</label>
                        </div>
                    </div>
                    <div class="divider mt-5 mb-5 border-bottom border-secondary"></div>
                    <h6 class="text-uppercase mt-5 mb-3 font-weight-bold">Тип тварини</h6>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="type-1" name="type">
                            <label class="custom-control-label" for="type-1">Собаки</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="type-2" name="type">
                            <label class="custom-control-label" for="type-2">Коти</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="type-3" name="type">
                            <label class="custom-control-label" for="type-3">Інше</label>
                        </div>
                    </div>
                    <div class="divider mt-5 mb-5 border-bottom border-secondary"></div>
                    <h6 class="text-uppercase mt-5 mb-3 font-weight-bold">Розмір тварини</h6>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="size-1" name="size">
                            <label class="custom-control-label" for="size-1">До 35 см</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="size-2" name="size">
                            <label class="custom-control-label" for="size-2">Від 35 до 50 см</label>
                        </div>
                    </div>
                    <div class="mt-2 mb-2 pl-2">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="size-3" name="size">
                            <label class="custom-control-label" for="size-3">Від 50 см</label>
                        </div>
                    </div>
                    <a href="#" class="btn btn-lg btn-block btn-primary mt-5">Шукати</a>
                </div>
            </div>
        </div>
    </div>
</#if>


<#include "footer.ftl">

<style>
    #visitCounter {
        background-color: #000000;
        opacity: 0.8;
        font-size: 18px;
        margin-top: -25px;
        width: 80px;
        text-align: center;
        color: #ffffff;
        margin-bottom: 0;
    }

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
</style>