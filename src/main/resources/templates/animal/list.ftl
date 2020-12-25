<#include "../header.ftl">
<div class="container">


     <#if animals.content[0].animalStatus == "FREE">
         <h1 class="text-center font-italic font-weight-bold font-family">Не купуй - візьми!</h1>
     <#elseif animals.content[0].animalStatus == "TREATMENT">
         <h1 class="text-center font-italic font-weight-bold font-family">Нам потрібна ваша підтримка!</h1>
     </#if>

    <#if animals.totalPageNumber != 0 >
        <div>
                <div class="">
                    <input type="radio" id="animalType"
                           name="contact" value="DOG" onclick="handleAnimalTypeCheckBoxes()">
                    <label for="contactChoice1">Собаки</label>

                    <input type="radio" id="animalType"
                           name="contact" value="CAT" onclick="handleAnimalTypeCheckBoxes()">
                    <label for="contactChoice2">Коти</label>

                    <input type="radio" href="/api/animals/type?animalType=OTHER"
                           name="contact" onclick="handleAnimalTypeCheckBoxes()">
                    <label for="contactChoice3">Інше</label>
                </div>

                <div class="btn btn-outline-success my-2 my-sm-0" style="margin: 15px 25px;">
                    <a href="/api/animals/create" type="submit" >Додати тварину</a>
                </div>
        </div>

        <div class="row justify-content-center" id="animalList">
            <#list animals.content as animal>
                <div class="col-4 clearfix d-none d-md-block mt-5">
                            <div class="card mb-2 zoom">
                                <a href="/animals/${animal.id}">
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
                                            <a href="/orders/new/${animal.id}" class="row justify-content-center">
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

