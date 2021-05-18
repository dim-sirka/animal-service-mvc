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

<#--<div class="container">-->
<#--    <div class="card mb-2">-->
<#--        <div class="row justify-content-center mt-2">-->
<#--            <form action="/admin/animals/new" method="post" autocomplete="off">-->
<#--                <div class="col-11 block pt-5">-->
<#--                    <table class="table table-hover mb-0">-->
<#--                        <tbody>-->
<#--                        <tr>-->
<#--                            <th class="align-middle" scope="row">Ім'я тварини:</th>-->
<#--                            <td class="td-padding">-->
<#--                                <input name="name" placeholder=""-->
<#--                                       type="text"/>-->
<#--                            </td>-->
<#--                        </tr>-->
<#--                        <tr>-->
<#--                            <th class="align-middle" scope="row">Вік тварини:</th>-->
<#--                            <td class="td-padding">-->
<#--                                <input name="age" placeholder="" value=""-->
<#--                                       type="text" tabindex="2" />-->
<#--                            </td>-->
<#--                        </tr>-->
<#--                        <tr>-->
<#--                            <th class="align-middle" scope="row">Тип тварини:</th>-->
<#--                            <td class="td-padding">-->
<#--                                <select class="select-program col-md-12" name="animalType" required>-->
<#--                                    <option name="animalType" disabled selected>Тип тварини:</option>-->
<#--                                    <option>DOG</option>-->
<#--                                    <option>CAT</option>-->
<#--                                    <option>OTHER</option>-->
<#--                                </select>-->
<#--                            </td>-->
<#--                        </tr>-->
<#--                        <tr>-->
<#--                            <th class="align-middle" scope="row">Опис тварини:</th>-->
<#--                            <td class="td-padding">-->
<#--                                <input name="description" placeholder="" value=""-->
<#--                                       type="text" tabindex="4">-->
<#--                            </td>-->
<#--                        </tr>-->
<#--                        <tr>-->
<#--                            <th class="align-middle" scope="row">Посилання на фото:</th>-->
<#--                            <td class="td-padding">-->
<#--                                <input name="mediaLinks" placeholder="" value=""-->
<#--                                       type="text" tabindex="5">-->
<#--                            </td>-->
<#--                        </tr>-->
<#--                        </tbody>-->
<#--                    </table>-->
<#--                    <fieldset class="row justify-content-center tm-10">-->
<#--                        <button name="Submit" type="submit" class="col-4 btn btn-primary text-center submitBtn" data-submit="...Sending">-->
<#--                            Зберегти-->
<#--                        </button>-->
<#--                    </fieldset>-->
<#--                </div>-->
<#--                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />-->
<#--            </form>-->
<#--        </div>-->
<#--    </div>-->
<#--</div>-->
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
                                        <p><span class="wpcf7-form-control-wrap your-subject"><input
                                                        type="text" name="name" value="" size="40"
                                                        class="wpcf7-form-control wpcf7-text"
                                                        aria-invalid="false"
                                                        placeholder="Ім'я тварини:"/></span></p>
                                        <p><span class="wpcf7-form-control-wrap your-subject"><input
                                                        type="text"  name="age" value="" size="40"
                                                        class="wpcf7-form-control wpcf7-text"
                                                        aria-invalid="false"
                                                        placeholder="Вік тварини:"/></span></p>
                                        <p><span class="wpcf7-form-control-wrap your-subject"><input
                                                        type="text" name="mediaLinks" value=""
                                                        size="40" class="wpcf7-form-control wpcf7-text"
                                                        aria-invalid="false"
                                                        placeholder="Посилання на фото:"/></span></p>
                                        <select class="select-program col-md-12" name="animalType" required>
                                            <option name="animalType" disabled selected>Тип тварини:</option>
                                            <option>DOG</option>
                                            <option>CAT</option>
                                            <option>OTHER</option>
                                        </select>
                                        <p><span class="wpcf7-form-control-wrap your-subject"><input
                                                        type="text" name="description" value=""
                                                        size="40" class="wpcf7-form-control wpcf7-text"
                                                        aria-invalid="false"
                                                        placeholder="Опис:"/></span></p>
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
<#--                    <div class="wpb_column vc_column_container vc_col-sm-12 vc_col-lg-6 vc_col-md-6">-->
<#--                        <div class="vc_column-inner" style="margin-top: 15%;">-->
<#--                            <div class="wpb_wrapper">-->
<#--                                <div role="form" class="wpcf7" id="wpcf7-f126-p127-o1" lang="en-US"-->
<#--                                     dir="ltr">-->
<#--                                    <div class="screen-reader-response"></div>-->
<#--                                    <img src="${animal.mediaLinks}" alt="..." class="img-thumbnail">-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
                </div>
            </div>
        </div>
    </div>
</div>
<#include "../animal/footer.ftl">

