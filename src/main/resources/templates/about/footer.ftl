<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"]/>
<style>
    .gm-control-active > img {
        box-sizing: content-box;
        display: none;
        left: 50%;
        pointer-events: none;
        position: absolute;
        top: 50%;
        transform: translate(-50%, -50%)
    }

    .gm-control-active > img:nth-child(1) {
        display: block
    }

    .gm-control-active:hover > img:nth-child(1), .gm-control-active:active > img:nth-child(1) {
        display: none
    }

    .gm-control-active:hover > img:nth-child(2), .gm-control-active:active > img:nth-child(3) {
        display: block
    }

    .gm-ui-hover-effect {
        opacity: .6
    }

    .gm-ui-hover-effect:hover {
        opacity: 1
    }

    .gm-style .gm-style-cc span, .gm-style .gm-style-cc a, .gm-style .gm-style-mtc div {
        font-size: 10px;
        box-sizing: border-box
    }

    @media print {
        .gm-style .gmnoprint, .gmnoprint {
            display: none
        }
    }

    @media screen {
        .gm-style .gmnoscreen, .gmnoscreen {
            display: none
        }
    }

    .gm-style-pbc {
        transition: opacity ease-in-out;
        background-color: rgba(0, 0, 0, 0.45);
        text-align: center
    }

    .gm-style-pbt {
        font-size: 22px;
        color: white;
        font-family: Roboto, Arial, sans-serif;
        position: relative;
        margin: 0;
        top: 50%;
        -webkit-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        transform: translateY(-50%)
    }

    .gm-style img {
        max-width: none;
    }

    .gm-style {
        font: 400 11px Roboto, Arial, sans-serif;
        text-decoration: none;
    }

    .fluid-width-video-wrapper {
        width: 100%;
        position: relative;
        padding: 0;
        min-height: 1px;
    }

    .fluid-width-video-wrapper iframe, .fluid-width-video-wrapper object, .fluid-width-video-wrapper embed {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    img.wp-smiley,
    img.emoji {
        display: inline !important;
        border: none !important;
        box-shadow: none !important;
        height: 1em !important;
        width: 1em !important;
        margin: 0 .07em !important;
        vertical-align: -0.1em !important;
        background: none !important;
        padding: 0 !important;
    }

</style>
<style id="rs-plugin-settings-inline-css" type="text/css">
    #rs-demo-id {
    }

</style>
<style type="text/css">
    .recentcomments a {
        display: inline !important;
        padding: 0 !important;
        margin: 0 !important;
    }
</style>
<style type="text/css" data-type="vc_shortcodes-custom-css">
    .vc_custom_1472631590873 {
        background-image: url(https://bridge82.qodeinteractive.com/wp-content/uploads/2016/08/image.jpg?id=22) !important;
        background-position: center !important;
        background-repeat: no-repeat !important;
        background-size: cover !important;
    }

    .vc_custom_1472637221526 {
        padding-top: 58px !important;
    }

    .vc_custom_1474273042405 {
        padding-top: 52px !important;
    }

    .vc_custom_1491918499778 {
        margin-bottom: -79px !important;
        padding-top: 72px !important;
    }

    .vc_custom_1481541074234 {
        background-image: url(https://bridge82.qodeinteractive.com/wp-content/uploads/2016/08/background.jpg?id=207) !important;
        background-position: center !important;
        background-repeat: no-repeat !important;
        background-size: cover !important;
    }

    .vc_custom_1472639134641 {
        padding-top: 102px !important;
        padding-bottom: 38px !important;
    }

    .vc_custom_1472634047354 {
        padding-top: 30px !important;
        padding-bottom: 30px !important;
        background-color: #70949d !important;
    }

    .vc_custom_1492610180771 {
        padding-top: 20% !important;
        padding-bottom: 20% !important;
    }

    .vc_custom_1481124718179 {
        margin-top: -12.2% !important;
    }

    .vc_custom_1492524794936 {
        padding-right: 0px !important;
        padding-left: 0px !important;
    }

    .vc_custom_1492524801071 {
        padding-right: 0px !important;
        padding-left: 0px !important;
    }

    .vc_custom_1481540011171 {
        padding-top: 67px !important;
        padding-bottom: 106px !important;
    }
</style>
<style type="text/css" data-type="vc_shortcodes-custom-css-5">
    .vc_custom_1472631590873 {
        background-image: url(https://i.ibb.co/2hdjQnZ/friends-1149841-1920dark.jpg) !important;
        background-position: center !important;
        background-repeat: no-repeat !important;
        background-size: cover !important;
    }

    .vc_custom_1472637221526 {
        padding-top: 58px !important;
    }

    .vc_custom_1474273042405 {
        padding-top: 52px !important;
    }

    .vc_custom_1491918499778 {
        margin-bottom: -79px !important;
        padding-top: 72px !important;
    }

    .vc_custom_1481541074234 {
        background-image: url(https://bridge82.qodeinteractive.com/wp-content/uploads/2016/08/background.jpg?id=207) !important;
        background-position: center !important;
        background-repeat: no-repeat !important;
        background-size: cover !important;
    }

    .vc_custom_1472639134641 {
        padding-top: 102px !important;
        padding-bottom: 38px !important;
    }

    .vc_custom_1472634047354 {
        padding-top: 30px !important;
        padding-bottom: 30px !important;
        background-color: #70949d !important;
    }

    .vc_custom_1492610180771 {
        padding-top: 20% !important;
        padding-bottom: 20% !important;
    }

    .vc_custom_1481124718179 {
        margin-top: -12.2% !important;
    }

    .vc_custom_1492524794936 {
        padding-right: 0px !important;
        padding-left: 0px !important;
    }

    .vc_custom_1492524801071 {
        padding-right: 0px !important;
        padding-left: 0px !important;
    }

    .vc_custom_1481540011171 {
        padding-top: 67px !important;
        padding-bottom: 106px !important;
    }
</style>
<style>

    body {
        font-family: 'Roboto';
        font-size: 16px;
    }

    .aboutus-section {
        padding: 90px 0;
    }

    .aboutus-title {
        font-size: 30px;
        letter-spacing: 0;
        line-height: 32px;
        margin: 0 0 39px;
        padding: 0 0 11px;
        position: relative;
        text-transform: uppercase;
        color: #000;
    }

    .aboutus-title::after {
        background: #fdb801 none repeat scroll 0 0;
        bottom: 0;
        content: "";
        height: 2px;
        left: 0;
        position: absolute;
        width: 54px;
    }

    .aboutus-text {
        color: #606060;
        font-size: 13px;
        line-height: 22px;
        margin: 0 0 35px;
    }

    a:hover, a:active {
        color: #ffb901;
        text-decoration: none;
        outline: 0;
    }

    .aboutus-more {
        border: 1px solid #fdb801;
        border-radius: 25px;
        color: #fdb801;
        display: inline-block;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 0;
        padding: 7px 20px;
        text-transform: uppercase;
    }

    .feature .feature-box .iconset {
        background: #fff none repeat scroll 0 0;
        float: left;
        position: relative;
        width: 18%;
    }

    .feature .feature-box .iconset::after {
        background: #fdb801 none repeat scroll 0 0;
        content: "";
        height: 150%;
        left: 43%;
        position: absolute;
        top: 100%;
        width: 1px;
    }

    .feature .feature-box .feature-content h4 {
        color: #0f0f0f;
        font-size: 18px;
        letter-spacing: 0;
        line-height: 22px;
        margin: 0 0 5px;
    }


    .feature .feature-box .feature-content {
        float: left;
        padding-left: 28px;
        width: 78%;
    }

    .feature .feature-box .feature-content h4 {
        color: #0f0f0f;
        font-size: 18px;
        letter-spacing: 0;
        line-height: 22px;
        margin: 0 0 5px;
    }

    .feature .feature-box .feature-content p {
        color: #606060;
        font-size: 13px;
        line-height: 22px;
    }

    .icon {
        color: #f4b841;
        padding: 0px;
        font-size: 40px;
        border: 1px solid #fdb801;
        border-radius: 100px;
        color: #fdb801;
        font-size: 28px;
        height: 70px;
        line-height: 70px;
        text-align: center;
        width: 70px;
    }

    }
</style>
<style type="text/css">
    .map-container-5 {
        overflow: hidden;
        padding-bottom: 56.25%;
        position: relative;
        height: 0;
    }

    .map-container-5 iframe {
        left: 0;
        top: 0;
        height: 100%;
        width: 100%;
        position: absolute;
    }
</style>

