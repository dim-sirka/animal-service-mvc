<#include "../header.ftl">
<div class="container">
    <#if animals[0]??>
            <#if animals[0].animalStatus == "FREE">
                <h1 class="text-center font-italic font-weight-bold font-family">Не купуй - візьми!</h1>
            <#elseif animals[0].animalStatus == "TREATMENT">
                <h1 class="text-center font-italic font-weight-bold font-family">Нам потрібна ваша підтримка!</h1>
            </#if>
        <div class="row justify-content-center">
            <#list animals as animal>
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
                                            <a href="api/orders/new/${animal.id}" class="row justify-content-center">
                                                    <button class="col-8 btn btn-primary text-center" type="submit">Створити замовлення</button>
                                            </a>
                                        <#elseif animal.animalStatus == "TREATMENT">
    <#--                                        Make payment by means of googlePay-->
                                            <a href="/" class="row justify-content-center">
                                                    <button class="col-8 btn btn-primary text-center" type="submit">Пожертвувати</button>
                                            </a>
                                        </#if>
                                </div>
                            </div>
                </div>
            </#list>
        </div>
    </#if>
</div>
<#include "../footer.ftl">

