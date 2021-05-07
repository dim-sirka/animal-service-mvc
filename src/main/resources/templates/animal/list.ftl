<#include "header.ftl">


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
                                        <div class="qode-specification-list-image">
                                            <a href="/animals/${animal.id}">
                                                <#if animal.mediaLinks??>
                                                    <img class="card-img-top card-item-img"
                                                         src="${animal.mediaLinks[0]}">
                                                <#else>
                                                    <img class="card-img-top card-item-img"
                                                         src="https://pixy.org/src/120/1206832.jpg">
                                                </#if>
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


<#include "footer.ftl">
