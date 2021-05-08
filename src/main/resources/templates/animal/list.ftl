<#include "header.ftl">
<#assign pageSubmissionUrl = animalStatus???then('&animalStatus=${animalStatus}','') >
<style>
    #visitCounter{
        background-color: #000000;
        opacity: 0.8;
        font-size:18px;
        width: 43px;
        height: 34px;
        color: #ffffff;
        margin-top: -34px
    }
</style>
<#if animals.totalPageNumber != 0 >
    <div>
        <div class="">
            <input type="radio" id="animalType"
                   name="contact" value="DOG"
                   onclick="handleAnimalTypeCheckBoxes()">
            <label for="contactChoice1">Собаки</label>

            <input type="radio" id="animalType"
                   name="contact" value="CAT"
                   onclick="handleAnimalTypeCheckBoxes()">
            <label for="contactChoice2">Коти</label>

            <input type="radio" href="/animals/type?animalType=OTHER"
                   name="contact" onclick="handleAnimalTypeCheckBoxes()">
            <label for="contactChoice3">Інше</label>
        </div>

        <@sec.authorize access="isAuthenticated()">
            <div class="btn btn-outline-success my-2 my-sm-0"
                 style="margin: 15px 25px;">
                <a href="/admin/animals/create" type="submit">Додати
                    тварину</a>
            </div>
        </@sec.authorize>
    </div>
    <div class="full_width">
        <div class="full_width_inner">
            <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1478095417449 grid_section"
                 style=" text-align:left;">
                <div class=" section_inner clearfix">
                    <div class="section_inner_margin clearfix">
                        <#list animals.content as animal>
                            <div class="wpb_column vc_column_container vc_col-sm-10 vc_col-lg-offset-0 vc_col-lg-4 vc_col-md-offset-0 vc_col-md-4 vc_col-sm-offset-1">
                                <div class="vc_column-inner">
                                    <div class="wpb_wrapper">
                                        <div class="qode-specification-list">
                                            <div class="qode-specification-list-image" >
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
                                                            ">
                                                    </#if>
                                                    <p id="visitCounter">
                                                        <i class="fa fa-eye" style="font-size: 18px; color: #f8f9fa"></i> ${animal.visitCounter}
                                                    </p>
                                                </a>
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
                </div>
            </div>
        </div>
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
</#if>


<#include "footer.ftl">
