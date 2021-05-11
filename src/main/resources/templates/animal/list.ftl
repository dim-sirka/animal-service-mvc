<#include "header.ftl">
<style>
    #visitCounter{
        background-color: #000000;
        opacity: 0.8;
        font-size:18px;
        width: 43px;
        height: 34px;
        color: #ffffff;
        margin-top: 152px
    }

    #labelForImg{
        background-color: #d38960;
        opacity: 0.8;
        font-size:18px;
        width: 170px;
        height: 34px;
        color: #ffffff;
        margin-top: -220px
    }

    .list-item-id-unique {
        position: absolute;
        bottom: 367px;
        right: 15px;
        background-color: #4a4a4a;
        color: #fff;
        padding: 3px 10px;
        font-size: 13px;
    }
</style>
<#if animals.totalPageNumber != 0 >
    <div>
        <div class="container pt-5">
            <div class="row">
                <div class="col-md-8 order-md-2 col-lg-9">
                    <div class="container-fluid">
                        <div class="row   mb-5">
                            <div class="col-12">
                                <div class="dropdown text-md-left text-center float-md-left mb-3 mt-3 mt-md-0 mb-md-0">
                                    <label class="mr-2">Сортувати за:</label>
                                    <a class="btn btn-lg btn-light dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false">Датою додавання <span class="caret"></span></a>
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
                                    <button type="button" class="btn btn-lg btn-light"><span
                                                class="fa fa-arrow-right"></span></button>
                                </div>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                                <div class="dropdown float-right">
                                    <label class="mr-2">Вигляд:</label>
                                    <a class="btn btn-lg btn-light dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false">6 <span class="caret"></span></a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown"
                                         x-placement="bottom-end"
                                         style="will-change: transform; position: absolute; transform: translate3d(120px, 48px, 0px); top: 0px; left: 0px;">
                                        <a class="dropdown-item" href="#">12</a>
                                        <a class="dropdown-item" href="#">24</a>
                                        <a class="dropdown-item" href="#">48</a>
                                        <a class="dropdown-item" href="#">96</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <@sec.authorize access="isAuthenticated()">
                                <div class="btn btn-outline-success my-2 my-sm-0"
                                     style="margin: 15px 25px;">
                                    <a href="/admin/animals/create" type="submit">Додати
                                        тварину</a>
                                </div>
                            </@sec.authorize>
                            <#list animals.content as animal>
                                <div class="wpb_column vc_column_container vc_col-sm-10 vc_col-lg-offset-0 vc_col-lg-4 vc_col-md-offset-0 vc_col-md-4 vc_col-sm-offset-1">
                                    <div class="vc_column-inner">
                                        <div class="wpb_wrapper">
                                            <div class="qode-specification-list">
                                                <div class="qode-specification-list-image">
                                                    <a href="/animals/${animal.id}">
                                                        <#if animal.mediaLinks??>
                                                            <img class="card-img-top card-item-img"
                                                                 style="height:220px; visibility: visible;"
                                                                 src="${animal.mediaLinks[0]}"
                                                            >
                                                        <#else>
                                                            <img class="card-img-top card-item-img"
                                                                 style="height:220px; visibility: visible;"
                                                                 src="https://pixy.org/src/120/1206832.jpg"
                                                            >
                                                        </#if>
<#--                                                        <p id="labelForImg" style=" background-color: #d38960;">Не влаштовано</p>-->
                                                        <p id="labelForImg" style=" background-color: #ff0000">Потребує допомоги</p>
<#--                                                        <p id="labelForImg" style=" background-color: #6096d3;">Влаштовано</p>-->
                                                        <p id="visitCounter">
                                                            <i class="fa fa-eye" style="font-size: 18px; color: #f8f9fa">32</i>
                                                        </p>
                                                    </a>
                                                </div>
                                                <div class="list-item-id-unique">
                                                    ID 9278
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

                            </#list>
                        </div>
                        <div class="row justify-content-center">
                            <ul class="pagination justify-content-center">
                                <li class="page-item  <#if !animals.hasPreviousPage >disabled</#if>">
                                    <a class="page-link"
                                       href="?page=${animals.currentPageNumber - 1}${pageSubmissionUrl}"
                                       tabindex="-1">Previous</a>
                                </li>
                                <#list 1..animals.totalPageNumber as pageNumber>
                                    <li class="page-item <#if animals.currentPageNumber == pageNumber>active</#if>">
                                        <a class="page-link"
                                           href="?page=${pageNumber}${pageSubmissionUrl}">${pageNumber}</a>
                                    </li>
                                </#list>
                                <li class="page-item <#if ! animals.hasNextPage >disabled</#if>">
                                    <a class="page-link"
                                       href="?page=${animals.currentPageNumber + 1}${pageSubmissionUrl}"
                                       tabindex="-1">Next</a>
                                </li>
                            </ul>
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
        <div class="">
            <#--            <input type="radio" id="animalType"-->
            <#--                   name="contact" value="DOG"-->
            <#--                   onclick="handleAnimalTypeCheckBoxes()">-->
            <#--            <label for="contactChoice1">Собаки</label>-->

            <#--            <input type="radio" id="animalType"-->
            <#--                   name="contact" value="CAT"-->
            <#--                   onclick="handleAnimalTypeCheckBoxes()">-->
            <#--            <label for="contactChoice2">Коти</label>-->

            <#--            <input type="radio" href="/animals/type?animalType=OTHER"-->
            <#--                   name="contact" onclick="handleAnimalTypeCheckBoxes()">-->
            <#--            <label for="contactChoice3">Інше</label>-->
        </div>
    </div>
</#if>


<#include "footer.ftl">
