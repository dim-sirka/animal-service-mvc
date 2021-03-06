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
                        <h1><span>Додавання нової тварини</span></h1>
                        <span class="subtitle">Введіть інформацію про тварину</span>
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
            <div class=" section_inner clearfix">
                <div class='section_inner_margin clearfix'>
                    <div class="vc_column-inner" style="margin-top: 4%; margin-left: 10%; margin-right: 10%;">
                        <div class="wpb_wrapper">
                            <div role="form" class="wpcf7" id="wpcf7-f126-p127-o1" lang="en-US"
                                 dir="ltr">
                                <div class="screen-reader-response"></div>
                                <form action="/admin/animals/new" method="post" autocomplete="off"
                                      class="wpcf7-form cf7_custom_style_1">
                                    <p><span class="wpcf7-form-control-wrap your-subject">Ім'я тварини:<input
                                                    type="text" name="name" value="" size="40"
                                                    class="wpcf7-form-control wpcf7-text"
                                                    aria-invalid="false"
                                                    placeholder="Ім'я тварини:"/></span></p>
                                    <p><span class="wpcf7-form-control-wrap your-subject">Вік тварини:<input
                                                    type="text" name="age" value="" size="40"
                                                    class="wpcf7-form-control wpcf7-text"
                                                    aria-invalid="false"
                                                    placeholder="Вік тварини:"/></span></p>
                                    <p><span class="wpcf7-form-control-wrap your-subject">Посилання на фото:<input
                                                    type="text" name="mediaLinks" value=""
                                                    size="40" class="wpcf7-form-control wpcf7-text"
                                                    aria-invalid="false"
                                                    placeholder="Посилання на фото:"/></span></p>
                                    <p>Тип тварини:<span class="wpcf7-form-control-wrap message"><select class="select-program col-md-12" name="animalType" required>
                                        <option name="animalType" disabled selected>Тип тварини:</option>
                                        <option>DOG</option>
                                        <option>CAT</option>
                                        <option>OTHER</option>
                                            </select></span></p>
                                    <p>Опис:<span class="wpcf7-form-control-wrap message">
                                            <textarea type="text"
                                                      name="description" cols="40" rows="10"
                                                      class="wpcf7-form-control wpcf7-textarea"
                                                      aria-invalid="false"
                                                      placeholder="Опис:"></textarea></span></p>
                                    <div class="row">
                                        <div class="col" style="text-align: center;">
                                            <button name="Submit" type="submit" class="btn btn-outline-dark"
                                                    data-submit="...Sending">
                                                Зберегти
                                            </button>
                                        </div>
                                    </div>
                                    <div class="wpcf7-response-output wpcf7-display-none"></div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                            </div>
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

