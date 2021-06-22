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
                        <h1><span>Зв'яжись з нами</span></h1>
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
             style=' text-align:left;'>
            <#if success??>
                <div class="alert alert-success">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Success!</strong> Ваше замовлення зареєстровано!
                </div>
            </#if>
            <div class=" section_inner clearfix">
                <div class="vc_column-inner" style="margin: 5%;">
                    <div class="wpb_wrapper">
                        <div role="form" class="wpcf7" id="wpcf7-f126-p127-o1" lang="en-US"
                             dir="ltr">
                            <div class="screen-reader-response"></div>
                            <form action="/message/new" method="post" autocomplete="off"
                                  class="wpcf7-form cf7_custom_style_1" novalidate="novalidate">
<#--                                <div style="display: none;">-->
<#--                                    <input type="hidden" name="_wpcf7" value="126"/>-->
<#--                                    <input type="hidden" name="_wpcf7_version" value="5.1.6"/>-->
<#--                                    <input type="hidden" name="_wpcf7_locale" value="en_US"/>-->
<#--                                    <input type="hidden" name="_wpcf7_unit_tag"-->
<#--                                           value="wpcf7-f126-p127-o1"/>-->
<#--                                    <input type="hidden" name="_wpcf7_container_post"-->
<#--                                           value="127"/>-->
<#--                                </div>-->
                                <p>Ваше Ім'я:<span class="wpcf7-form-control-wrap full-name"><input
                                                type="text" name="userName" size="5"
                                                class="wpcf7-form-control wpcf7-text"
                                                aria-invalid="false"
                                                placeholder="Ваше Ім'я"/></span></p>
                                <p>Ваш e-mail адрес:<span class="wpcf7-form-control-wrap email"><input
                                                type="email" name="userEmail"
                                                class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email"
                                                aria-invalid="false"
                                                placeholder="Ваш e-mail адрес"/></span></p>
                                <p>Тема:<span class="wpcf7-form-control-wrap your-subject"><input
                                                type="text" name="topic"
                                                size="5" class="wpcf7-form-control wpcf7-text"
                                                aria-invalid="false"
                                                placeholder="Тема"/></span></p>
                                <p>Опишіть тут:<span class="wpcf7-form-control-wrap your-subject"><input
                                                type="text"
                                                name="description"
                                                size="10" class="wpcf7-form-control wpcf7-text"
                                                aria-invalid="false"
                                                placeholder="Опишіть тут"/></span></p>
                                <p style="text-align: center;"><input type="submit" value="Надіслати"
                                                                      class="wpcf7-form-control wpcf7-submit"/></p>
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
<script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/3f0fa.js"></script>
<script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/5f16d.js"></script>
<script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/00530.js"></script>
<script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/9d9d4.js"></script>
<script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/e5338.js"></script>
<#include "../animal/footer.ftl">