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
                        <h1><span>Реєстрація замовлення</span></h1>
                        <span class="subtitle">Введіть ваші дані</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="full_width">
    <div class="full_width_inner">
        <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1478091158622 grid_section"
             style=' text-align:center;'>
            <#if success??>
                <div class="alert alert-success">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Success!</strong> Ваше замовлення зареєстровано!
                </div>
            </#if>
            <div class=" section_inner clearfix">
                <div class='section_inner_margin clearfix'>
                    <div class="wpb_wrapper">
                        <div role="form" class="wpcf7" id="wpcf7-f126-p127-o1" lang="en-US"
                             dir="ltr">
                            <div class="screen-reader-response"></div>
                            <form id="client" action="/orders/new" method="post" autocomplete="off"
                                  class="wpcf7-form cf7_custom_style_1" novalidate="novalidate"
                                  style="margin-top: 5%;margin-bottom: 5%;margin-left: 15%;margin-right: 15%;">
                                <input type="hidden" name="animalId" placeholder="" value="<#if id??>${id}<#else></#if>"
                                       type="number" tabindex="1" required autofocus/>
                                <p><span class="wpcf7-form-control-wrap full-name"><input
                                                type="text" name="userName" value="" size="40"
                                                class="wpcf7-form-control wpcf7-text"
                                                aria-invalid="false"
                                                placeholder="Ваше ім'я та прізвище:"/></span></p>
                                <p><span class="wpcf7-form-control-wrap email"><input
                                                type="email" name="userEmail" value="" size="40"
                                                class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email"
                                                aria-invalid="false"
                                                placeholder="Ваша електронна адреса:"/></span></p>
                                <p><span class="wpcf7-form-control-wrap your-subject"><input
                                                type="text" name="userPhoneNumber" value=""
                                                size="40" class="wpcf7-form-control wpcf7-text"
                                                aria-invalid="false"
                                                placeholder="Ваш номер телефону:"/></span></p>
                                <p><input type="submit" value="Надіслати"
                                          class="wpcf7-form-control wpcf7-submit"/></p>
                                <div class="wpcf7-response-output wpcf7-display-none"></div>
                                <#if error??>
                                    <div>
                                        <h5 class="text-danger">Errors: </h5>
                                        <pre class="text-danger">${error}</pre>
                                    </div>
                                </#if>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "../animal/footer.ftl">

