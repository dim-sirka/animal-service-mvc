<#include "./header.ftl">
<body class="home page-template page-template-full_width page-template-full_width-php page page-id-5 ajax_fade page_not_loaded  qode-title-hidden qode_grid_1300 footer_responsive_adv qode-theme-ver-11.0 wpb-js-composer js-comp-ver-6.0.5 vc_responsive"
      itemscope="" itemtype="http://schema.org/WebPage" style="height: auto; overflow: auto;">
<div class="wrapper">
    <div class="wrapper_inner">
        <header class="scroll_header_top_area  stick transparent scrolled_not_transparent with_border ajax_header_animation page_header">
            <div class="header_inner clearfix">
                <div class="header_top_bottom_holder">
                    <div class="header_bottom clearfix" style=" background-color:rgba(255, 255, 255, 0);">
                        <div class="container">
                            <div class="container_inner clearfix">
                                <div class="header_inner_left">
                                    <div class="mobile_menu_button">
                                        <span>
                                            <i class="qode_icon_font_awesome fa fa-bars "></i> 
                                        </span>
                                    </div>
                                    <div class="logo_wrapper">
                                        <div class="q_logo">
                                            <a itemprop="url" href="https://bridge82.qodeinteractive.com/"
                                               style="height: 74px; visibility: visible;">
                                                <img itemprop="image" class="normal"
                                                     src="https://i.ibb.co/QvVyg75/dim-sirka-Texture.png"
                                                     alt="Logo" style="height: 100%;">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="header_inner_right">
                                    <div class="side_menu_button_wrapper right">
                                        <div class="header_bottom_right_widget_holder"><span
                                                    class="q_social_icon_holder square_social" data-color="#ffffff"
                                                    data-hover-background-color="#9aa0b0" data-hover-color="#ffffff"><a
                                                        itemprop="url" href="https://www.facebook.com/dimsirka/"
                                                        target="_blank"><span
                                                            class="fa-stack "
                                                            style="background-color: rgba(255, 255, 255, 0.3); border-radius: 3px; border-width: 0px; margin: 0px 4px 0px 0px; font-size: 21px;"><span
                                                                aria-hidden="true" class="fa fa-facebook"
                                                                style="color: #ffffff;font-size: 15px;color: #ffffff;"></span></span></a></span><span
                                                    class="q_social_icon_holder square_social" data-color="#ffffff"
                                                    data-hover-background-color="#9aa0b0" data-hover-color="#ffffff"><a
                                                        itemprop="url" href="https://www.instagram.com/dim__sirka"
                                                        target="_blank"><span
                                                            class="fa-stack "
                                                            style="background-color: rgba(255,255,255,0.3);border-radius: 3px;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-width: 0px;margin: 0 4px 0 0;font-size: 21px;"><span
                                                                aria-hidden="true" class="fa fa-instagram "
                                                                style="color: #ffffff;font-size: 15px;"></span></span></a></span>
                                        </div>
                                        <div class="side_menu_button">
                                            <@sec.authorize access="isAuthenticated()">
                                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"
                                                        style="margin: 15px 10px;">Вихід
                                                </button>
                                            </@sec.authorize>
                                        </div>
                                    </div>
                                </div>
                                <nav class="main_menu drop_down right">
                                    <ul id="menu-main-menu" class="">
                                        <li id="nav-menu-item-34"
                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-5 current_page_item active narrow">
                                            <a href="/about" class=" current "><i
                                                        class="menu_icon blank fa"></i><span>Про нас</span><span
                                                        class="plus"></span></a></li>
                                        <li id="nav-menu-item-164"
                                            class="menu-item menu-item-type-post_type menu-item-object-page  narrow"><a
                                                    href="/animals?animalStatus=FREE" class=""><i
                                                        class="menu_icon blank fa"></i><span>Віддаємо</span><span
                                                        class="plus"></span></a></li>
                                        <li id="nav-menu-item-161"
                                            class="menu-item menu-item-type-post_type menu-item-object-page  narrow"><a
                                                    href="/animals?animalStatus=TREATMENT" class=""><i
                                                        class="menu_icon blank fa"></i><span>Лікування</span><span
                                                        class="plus"></span></a></li>
                                        <li id="nav-menu-item-162"
                                            class="menu-item menu-item-type-post_type menu-item-object-page  narrow"><a
                                                    href="/animals?animalStatus=ARCHIVE" class=""><i
                                                        class="menu_icon blank fa"></i><span>Архів</span><span
                                                        class="plus"></span></a></li>
                                        <li id="nav-menu-item-163"
                                            class="menu-item menu-item-type-post_type menu-item-object-page  narrow"><a
                                                    href="https://bridge82.qodeinteractive.com/contact-us/" class=""><i
                                                        class="menu_icon blank fa"></i><span>Контакти</span><span
                                                        class="plus"></span></a></li>
                                        <@sec.authorize access="isAuthenticated()">

                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" style="color: white; margin: 0 20px;"
                                               href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                               aria-haspopup="true" aria-expanded="false">
                                                Замовлення
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <a class="dropdown-item" href="/admin/list/orders">Замовлення</a>
                                                <a class="dropdown-item" href="/admin/list/archive_orders">Архів
                                                    замовлень</a>
                                            </div>
                                            </@sec.authorize>
                                    </ul>
                                </nav>
                                <nav class="mobile_menu">
                                    <ul id="menu-main-menu-1" class="">
                                        <li id="mobile-menu-item-164"
                                            class="menu-item menu-item-type-post_type menu-item-object-page "><a
                                                    href="/about" class=""><span>Про нас</span></a><span
                                                    class="mobile_arrow"><i class="fa fa-angle-right"></i><i
                                                        class="fa fa-angle-down"></i></span></li>
                                        <li id="mobile-menu-item-161"
                                            class="menu-item menu-item-type-post_type menu-item-object-page "><a
                                                    href="/animals?animalStatus=FREE" class=""><span>Віддаємо</span></a><span
                                                    class="mobile_arrow"><i class="fa fa-angle-right"></i><i
                                                        class="fa fa-angle-down"></i></span></li>
                                        <li id="mobile-menu-item-162"
                                            class="menu-item menu-item-type-post_type menu-item-object-page "><a
                                                    href="/animals?animalStatus=TREATMENT"
                                                    class=""><span>Лікування</span></a><span class="mobile_arrow"><i
                                                        class="fa fa-angle-right"></i><i
                                                        class="fa fa-angle-down"></i></span>
                                        </li>
                                        <li id="mobile-menu-item-163"
                                            class="menu-item menu-item-type-post_type menu-item-object-page "><a
                                                    href="/animals?animalStatus=ARCHIVE" class=""><span>Архів</span></a><span
                                                    class="mobile_arrow"><i class="fa fa-angle-right"></i><i
                                                        class="fa fa-angle-down"></i></span></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <a id="back_to_top" href="#" class="off">
<span class="fa-stack">
<i class="fa fa-arrow-up" style=""></i>
</span>
        </a>
        <div class="content " style="padding-top: 0px; min-height: 1644px;">
            <div class="content_inner  ">
                <script>
                    var page_scroll_amount_for_sticky = 900;

                </script>
                <div class="full_width">
                    <div class="full_width_inner">
                        <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1472631590873 grid_section"
                             style=" text-align:left;">
                            <div class=" section_inner clearfix">
                                <div class="section_inner_margin clearfix">
                                    <div class="wpb_column vc_column_container vc_col-sm-12">
                                        <div class="vc_column-inner vc_custom_1492610180771">
                                            <div class="wpb_wrapper">
                                                <div class="wpb_text_column wpb_content_element ">
                                                    <div class="wpb_wrapper">
                                                        <h2><span style="color: #ffffff;">Не купи, а візьми!</span></h2>
                                                    </div>
                                                </div>
                                                <div class="vc_empty_space" style="height: 27px"><span
                                                            class="vc_empty_space_inner"><span
                                                                class="empty_space_image"></span></span></div>
                                                <div class="vc_row wpb_row section vc_row-fluid vc_inner "
                                                     style=" text-align:left;">
                                                    <div class=" full_section_inner clearfix">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12 vc_col-lg-6">
                                                            <div class="vc_column-inner">
                                                                <div class="wpb_wrapper">
                                                                    <div class="wpb_text_column wpb_content_element ">
                                                                        <div class="wpb_wrapper">
                                                                            <h3><span style="color: #ffffff;">Кілька слів про ціль...</span>
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                    <div class="vc_empty_space"
                                                                         style="height: 39px"><span
                                                                                class="vc_empty_space_inner"><span
                                                                                    class="empty_space_image"></span></span>
                                                                    </div>
                                                                    <a itemprop="url"
                                                                       href="/animals?animalStatus=FREE"
                                                                       target="_self" class="qbutton  white default"
                                                                       style="margin: 0 6px 6px 0; ">Більше</a><a
                                                                            itemprop="url"
                                                                            href="/animals?animalStatus=TREATMENT"
                                                                            target="_self"
                                                                            data-hover-background-color="#fafafa"
                                                                            data-hover-border-color="rgba(255,255,255,0.1)"
                                                                            data-hover-color="#414141"
                                                                            class="qbutton  default"
                                                                            style="color: rgb(255, 255, 255); border-color: rgb(250, 250, 250); margin: 0px 0px 6px; background-color: rgba(255, 255, 255, 0.01);">Пожертвувати</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="wpb_column vc_column_container vc_col-sm-6 vc_hidden-md vc_hidden-sm vc_hidden-xs">
                                                            <div class="vc_column-inner">
                                                                <div class="wpb_wrapper"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
                        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
                        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
                        <div class="aboutus-section">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-xs-12">
                                        <div class="aboutus">
                                            <h2 class="aboutus-title">Про нас</h2>
                                            <p class="aboutus-text"> Дім Сірка - загальнодоступна група, що об'єднує
                                                волонтерів БО "Дім Сірка", власників тварин, небайдужих громадян, які
                                                розділяють наше уявлення про цінність кожного життя.</p>
                                            <p class="aboutus-text">
                                                Наша місія - порятунок бездомних собак і котів, що опинилися в біді
                                                (автотравма, хвороба, жорстоке поводження тощо), пошук тимчасовго
                                                прихистку (перетримки) для тварин і їхня адопція (прилаштування).
                                            <p class="aboutus-text">
                                                Наша філософія - кожне життя важливе.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-xs-12">
                                        <div class="aboutus-banner">
                                            <img src="http://themeinnovation.com/demo2/html/build-up/img/home1/about1.jpg"
                                                 alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-5 col-sm-6 col-xs-12">
                                        <div class="feature">
                                            <div class="feature-box">
                                                <div class="clearfix">
                                                    <div class="iconset">
                                                        <span class="glyphicon glyphicon-cog icon"></span>
                                                    </div>
                                                    <div class="feature-content">
                                                        <h4>Автодопомога 🚗</h4>
                                                        <p>Перевозка тварин до клініки, на перетримку, в новий дім
                                                            тощо.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="feature-box">
                                                <div class="clearfix">
                                                    <div class="iconset">
                                                        <span class="glyphicon glyphicon-cog icon"></span>
                                                    </div>
                                                    <div class="feature-content">
                                                        <h4>Перетримка 🏠</h4>
                                                        <p>Тимчасове розміщення тварини на час її лікування,
                                                            соціалізації, пошуку дому.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="feature-box">
                                                <div class="clearfix">
                                                    <div class="iconset">
                                                        <span class="glyphicon glyphicon-cog icon"></span>
                                                    </div>
                                                    <div class="feature-content">
                                                        <h4>Матеріальна допомога 🐶🐱</h4>
                                                        <p>Їжа (сухий і вологий корм), пеленки, непотрібні речі, посуд,
                                                            ковдри тощо.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="feature-box">
                                                <div class="clearfix">
                                                    <div class="iconset">
                                                        <span class="glyphicon glyphicon-cog icon"></span>
                                                    </div>
                                                    <div class="feature-content">
                                                        <h4>Фінансова допомога 💰</h4>
                                                        <p>Адресна допомога або цільова здійснюється на картку-ключ
                                                            Голови ГО БО "Дім Сірка" Когут Н.В.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="feature-box">
                                                <div class="clearfix">
                                                    <div class="iconset">
                                                        <span class="glyphicon glyphicon-cog icon"></span>
                                                    </div>
                                                    <div class="feature-content">
                                                        <h4>Інформаційна підтримка 💻📱🎙</h4>
                                                        <p>Поширення наших публікацій і оголошень, запрошення своїх
                                                            друзів до нашої групи.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="vc_row wpb_row section vc_row-fluid  qode-lower-section-z-index vc_custom_1481541074234"
                     style=" text-align:center;">
                    <div class=" full_section_inner clearfix">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner vc_custom_1481540011171">
                                <div class="wpb_wrapper">
                                    <div class="vc_empty_space" style="height: 78px"><span
                                                class="vc_empty_space_inner"><span
                                                    class="empty_space_image"></span></span></div>
                                    <div class="wpb_text_column wpb_content_element ">
                                        <div class="wpb_wrapper">
                                            <h2><span style="color: #ffffff;">Як взяти тварину?</span>
                                            </h2>
                                        </div>
                                    </div>
                                    <div class="vc_empty_space" style="height: 19px"><span
                                                class="vc_empty_space_inner"><span
                                                    class="empty_space_image"></span></span></div>
                                    <div class="wpb_text_column wpb_content_element ">
                                        <div class="wpb_wrapper">
                                            <h3><span style="color: #ffffff;"></span>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="vc_empty_space" style="height: 70px"><span
                                                class="vc_empty_space_inner"><span
                                                    class="empty_space_image"></span></span></div>
                                    <div class="vc_row wpb_row section vc_row-fluid vc_inner  grid_section"
                                         style=" text-align:center;">
                                        <div class=" section_inner clearfix">
                                            <div class="section_inner_margin clearfix">
                                                <div class="wpb_column vc_column_container vc_col-sm-12">
                                                    <div class="vc_column-inner">
                                                        <div class="wpb_wrapper">
                                                            <div class="qode-numbered-process-holder qode-numbered-process-holder-items-four qodef-np-padding-large qode-np-line-solid qode-np-line-skin-light">
                                                                <div class="qode-numbered-process-inner">
                                                                    <div class="qode-np-item">
                                                                        <div class="qode-np-item-image-holder">
                                                                            <div class="qode-np-item-image-inner"
                                                                                 style="border-color: #ffffff; border-width: 2px">
                                                                                <div class="qode-np-item-image-table">
                                                                                    <div class="qode-np-item-image-table-cell">
                                                                                        <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/08/process-1.jpg"
                                                                                             alt="qode-np-item">
                                                                                    </div>
                                                                                </div>
                                                                                <span class="qode-np-item-number"
                                                                                      style="color: #414141; background-color: #ffffff">1</span>
                                                                            </div>
                                                                            <span class="qode-np-line"></span>
                                                                        </div>
                                                                        <h4 class="qode-np-title"
                                                                            style="color: #ffffff">
                                                                            Обери тварину </h4>
                                                                    </div>
                                                                    <div class="qode-np-item">
                                                                        <div class="qode-np-item-image-holder">
                                                                            <div class="qode-np-item-image-inner"
                                                                                 style="border-color: #ffffff; border-width: 2px">
                                                                                <div class="qode-np-item-image-table">
                                                                                    <div class="qode-np-item-image-table-cell">
                                                                                        <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/08/process-2.jpg"
                                                                                             alt="qode-np-item">
                                                                                    </div>
                                                                                </div>
                                                                                <span class="qode-np-item-number"
                                                                                      style="color: #414141; background-color: #ffffff">2</span>
                                                                            </div>
                                                                            <span class="qode-np-line"></span>
                                                                        </div>
                                                                        <h4 class="qode-np-title"
                                                                            style="color: #ffffff">
                                                                            Надішли форму нам. </h4>
                                                                    </div>
                                                                    <div class="qode-np-item">
                                                                        <div class="qode-np-item-image-holder">
                                                                            <div class="qode-np-item-image-inner"
                                                                                 style="border-color: #ffffff; border-width: 2px">
                                                                                <div class="qode-np-item-image-table">
                                                                                    <div class="qode-np-item-image-table-cell">
                                                                                        <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/08/process-3.jpg"
                                                                                             alt="qode-np-item">
                                                                                    </div>
                                                                                </div>
                                                                                <span class="qode-np-item-number"
                                                                                      style="color: #414141; background-color: #ffffff">3</span>
                                                                            </div>
                                                                            <span class="qode-np-line"></span>
                                                                        </div>
                                                                        <h4 class="qode-np-title"
                                                                            style="color: #ffffff">
                                                                            Зачекайте, ми з вами зв'яжемось! </h4>
                                                                    </div>
                                                                    <div class="qode-np-item">
                                                                        <div class="qode-np-item-image-holder">
                                                                            <div class="qode-np-item-image-inner"
                                                                                 style="border-color: #ffffff; border-width: 2px">
                                                                                <div class="qode-np-item-image-table">
                                                                                    <div class="qode-np-item-image-table-cell">
                                                                                        <img src="https://bridge82.qodeinteractive.com/wp-content/uploads/2016/08/process-4.jpg"
                                                                                             alt="qode-np-item">
                                                                                    </div>
                                                                                </div>
                                                                                <span class="qode-np-item-number"
                                                                                      style="color: #414141; background-color: #ffffff">4</span>
                                                                            </div>
                                                                            <span class="qode-np-line"></span>
                                                                        </div>
                                                                        <h4 class="qode-np-title"
                                                                            style="color: #ffffff">
                                                                            Забери улюбленця у домовленому місці</h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="footer_inner clearfix">
        <div class="footer_top_holder">
            <div class="footer_top">
                <div class="container">
                    <div class="container_inner">
                        <div class="three_columns clearfix">
                            <div class="column1 footer_col1">
                                <div class="column_inner">
                                    <div id="text-2" class="widget widget_text">
                                        <div class="textwidget">
                                            <img
                                                    src="https://i.ibb.co/QvVyg75/dim-sirka-Texture.png"
                                                    alt="logo">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="column2 footer_col2">
                                <div class="column_inner">
                                    <div id="text-3" class="widget widget_text">
                                        <h5>Як взяти тварину у нас?</h5>
                                    </div>
                                    <div id="nav_menu-2" class="widget widget_nav_menu">
                                        <div class="menu-footer-menu-container">
                                            <ul id="menu-footer-menu" class="menu">
                                                <li id="menu-item-45"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-45">
                                                    <a href="#">Як взяти тварину?</a></li>
                                                <li id="menu-item-46"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-46">
                                                    <a href="#">Які умови?</a></li>
                                                <li id="menu-item-47"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-47">
                                                    <a href="#">Реквізити оплати</a></li>
                                                <li id="menu-item-47"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-47">
                                                    <a href="#">Пошук</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="column3 footer_col3">
                                <div class="column_inner">
                                    <div id="text-4" class="widget widget_text"><h5>Розташування притулку</h5>
                                        <div class="textwidget">
                                            <div class="card card-cascade narrower">
                                                <div class="card-body card-body-cascade text-center">
                                                    <div id="map-container-google-9"
                                                         class="z-depth-1-half map-container-5" style="height: 300px">
                                                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10492.428344708474!2d24.7648442!3d48.8942963!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6a789a2223e12e2d!2z0JHQniDQlNGW0Lwg0KHRltGA0LrQsCAuINCf0YDQuNGC0YPQu9C-0Lo!5e0!3m2!1suk!2sua!4v1618412934686!5m2!1suk!2sua"
                                                                width="600" height="450" style="border:0;"
                                                                allowfullscreen="" loading="lazy"></iframe>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="https://www.google.com/maps/place/%D0%91%D0%9E+%D0%94%D1%96%D0%BC+%D0%A1%D1%96%D1%80%D0%BA%D0%B0+.+%D0%9F%D1%80%D0%B8%D1%82%D1%83%D0%BB%D0%BE%D0%BA/@48.8942963,24.7626555,17z/data=!3m1!4b1!4m5!3m4!1s0x4730c391910041fd:0x6a789a2223e12e2d!8m2!3d48.8942963!4d24.7648442">
                                                Івано-Франківська міськрада
                                                Івано-Франківська область, c. Микитинці</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="column2 footer_col2">
                                <div class="column_inner">
                                    <div id="text-3" class="widget widget_text"><h5>Контакти притулку</h5>
                                    </div>
                                    <div id="nav_menu-2" class="widget widget_nav_menu">
                                        <div class="menu-footer-menu-container">
                                            <ul id="menu-footer-menu" class="menu">
                                                <li id="menu-item-45"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-45">
                                                    <a href="#">Номер телефону: +380 98 557 7962</a></li>
                                                <li id="menu-item-45"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-45">
                                                    <a href="#">Електронна адреса: dimsirka_forum@ukr.net</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_bottom_holder">
            <div class="container">
                <div class="container_inner">
                    <div class="two_columns_50_50 footer_bottom_columns clearfix">
                        <div class="column1 footer_bottom_column">
                            <div class="column_inner">
                                <div class="footer_bottom">
                                    <div class="textwidget">© Created by students IPZ-41
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="column2 footer_bottom_column">
                            <div class="column_inner">
                                <div class="footer_bottom">
                                    <div class="menu-main-menu-container">
                                        <ul id="menu-main-menu-2" class="menu">
                                            <li id="menu-item-164"
                                                class="menu-item menu-item-type-post_type menu-item-object-page menu-item-164">
                                                <a href="/about">Про Нас</a>
                                            </li>
                                            <li id="menu-item-161"
                                                class="menu-item menu-item-type-post_type menu-item-object-page menu-item-161">
                                                <a href="/animals?animalStatus=FREE">Віддаємо</a></li>
                                            <li id="menu-item-162"
                                                class="menu-item menu-item-type-post_type menu-item-object-page menu-item-162">
                                                <a href="/animals?animalStatus=TREATMENT">Лікування</a>
                                            </li>
                                            <li id="menu-item-163"
                                                class="menu-item menu-item-type-post_type menu-item-object-page menu-item-163">
                                                <a href="/animals?animalStatus=ARCHIVE">Архів</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
</div>
</div>
<div class="qode-demos-toolbar" data-demo="bridge82.qodeinteractive.com">
    <script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/3f0fa.js"></script>
    <script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/5f16d.js"></script>
    <script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/00530.js"></script>
    <script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/9d9d4.js"></script>
    <script src="https://bridge82.qodeinteractive.com/wp-content/cache/minify/e5338.js"></script>
</body>
</html>
<#include "./footer.ftl">