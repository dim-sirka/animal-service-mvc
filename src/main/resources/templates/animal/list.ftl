<#include "../header.ftl">
<script>
    function handleAnimalTypeCheckBoxes() {
        let list = document.getElementById('animalType');
        let types;
        for (let i = 0; i < list.length; i++) {
            if (list[i].checked) {
                types += ',' + list[i].value()
            }
        }

        $.ajax({
            url: '/?page=1&types=' + 'CAT',
            success: function (res) {
                $("#animalList").empty();
               // $("#animalList").append(res);
            }
        });
    }
</script>
<div class="container">


     <#if animals.content[0].animalStatus == "FREE">
         <h1 class="text-center font-italic font-weight-bold font-family">Не купуй - візьми!</h1>
     <#elseif animals.content[0].animalStatus == "TREATMENT">
         <h1 class="text-center font-italic font-weight-bold font-family">Нам потрібна ваша підтримка!</h1>
     </#if>

    <#if animals.totalPageNumber != 0 >
        <div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="animalType" value="DOG" onclick="handleAnimalTypeCheckBoxes()">
                    <label class="form-check-label" for="inlineCheckbox1">Собаки</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="animalType" value="CAT" onclick="handleAnimalTypeCheckBoxes()">
                    <label class="form-check-label" for="inlineCheckbox2">Коти</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="animalType" value="OTHER" onclick="handleAnimalTypeCheckBoxes()">
                    <label class="form-check-label" for="inlineCheckbox3">Інше</label>
                </div>
        </div>
        <div class="row justify-content-center" id="animalList">
            <#list animals.content as animal>
                <div class="col-4 clearfix d-none d-md-block mt-5">
                            <div class="card mb-2 zoom">
                                <a href="/api/animals/${animal.id}">
                                    <#if animal.mediaLinks??>
                                      <img class="card-img-top card-item-img" src="${animal.mediaLinks[0]}">
                                         <#else>
                                      <img class="card-img-top card-item-img" src="https://pixy.org/src/120/1206832.jpg">
                                    </#if>
                                </a>
                                <div class="card-body">
                                    <h4 class="card-title">${animal.name}</h4>
                                    <p class="card-text">${animal.description}</p>
                                        <#if animal.animalStatus == "FREE">
                                            <a href="/api/orders/new/${animal.id}" class="row justify-content-center">
                                                    <button class="col-8 btn btn-primary text-center" type="submit">Створити замовлення</button>
                                            </a>
                                        <#elseif animal.animalStatus == "TREATMENT">
                                             <#--Make payment by means of googlePay-->
                                            <a href="/" class="row justify-content-center">
                                                    <button class="col-8 btn btn-primary text-center" type="submit">Пожертвувати</button>
                                            </a>
                                        </#if>
                                </div>
                            </div>
                </div>
            </#list>
        </div>


        <div class="row justify-content-center">
            <ul class="pagination">
                <li class="page-item  <#if !animals.hasPreviousPage >disabled</#if>">
                    <a class="page-link" href="?page=${animals.currentPageNumber - 1}" tabindex="-1">Previous</a>
                </li>
                <#list 1..animals.totalPageNumber as pageNumber>
                    <li class="page-item <#if animals.currentPageNumber == pageNumber>active</#if>">
                        <a class="page-link" href="?page=${pageNumber}">${pageNumber}</a>
                    </li>
                </#list>
                <li class="page-item <#if ! animals.hasNextPage >disabled</#if>">
                    <a class="page-link"  href="?page=${animals.currentPageNumber + 1}" tabindex="-1">Next</a>
                </li>
            </ul>
        </div>
    </#if>

    <script type="text/javascript" src="https://files.coinmarketcap.com/static/widget/coinMarquee.js"></script>
    <div id="coinmarketcap-widget-marquee" coins="1,1027,52,2,1831" currency="USD" theme="dark" transparent="false" show-symbol-logo="true"></div>

</div>
<#include "../footer.ftl">

