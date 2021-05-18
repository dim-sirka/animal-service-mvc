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
                        <h1><span>Список замовлень!</span></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<#assign pageSubmissionUrl = name???then('&name=${name}','') >
<#if orders.totalPageNumber != 0 >
    <div class="row" style="margin:3%;">
        <div class="input-group col text-center">
            <form action="/admin/orders/find" class="form-inline mx-auto">
                <#if name??>
                    <a href="/admin/list/orders" class="btn btn-secondary m-1">Reset</a>
                </#if>
                <input name="name" type="text" class="form-control" placeholder="Animal name"
                       <#if orders.name??>value="${orders.name}"</#if>
                       aria-label="Animal name" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-info" type="submit">Search</button>
                </div>
            </form>
        </div>
    </div>
    <div style="margin-left: 3%; margin-right: 3%">
        <table border="2" class="table <#if orders??>table <#else> table-dark </#if>">
            <thead class="<#if orders??>thead-dark <#else> thead </#if>">
            <tr class="d-flex">
                <th scope="col" class="col-1">ID</th>
                <th scope="col" class="col-3">Ім'я тварини</th>
                <th scope="col" class="col-2">Номер телефону</th>
                <th scope="col" class="col-2">Ім'я клієнта</th>
                <#if orders.content[0].orderStatus="PENDING">
                    <th class="col-4">Дії над замовленнями</th>
                <#else>
                    <th class="col-4">Статус замовлення</th>
                </#if>
            </tr>
            </thead>
            <tbody>
            <#list orders.content as order>
                <tr class="d-flex">
                    <th scope="row" class="col-1">${order.id}</th>
                    <td class="col-3"><a href="/animals/?name=${order.animal.name}">${order.animal.name}</a></td>
                    <td class="col-2">${order.userPhoneNumber}</td>
                    <td class="col-2">${order.userName}</td>
                    <#if order.orderStatus == "PENDING">
                        <th class="col-4 text-center">
                            <a href="/admin/orders/confirm/${order.id}">
                                <button class="btn btn-success" type="submit">Підтвердити</button>
                            </a>
                            <a href="/admin/orders/cancel/${order.id}">
                                <button class="btn btn-danger" type="submit">Скасувати</button>
                            </a>
                        </th>
                    <#elseif order.orderStatus == "CONFIRMED">
                        <th class="col-4 text-center">
                            <button class="btn btn-success" type="submit" disabled>Підтверджено</button>
                        </th>
                    <#elseif order.orderStatus == "CANCELED">
                        <th class="col-4 text-center">
                            <button class="btn btn-danger" type="submit" disabled>Скасовано</button>
                        </th>
                    </#if>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
        <ul class="pagination justify-content-center">
            <li class="page-item   <#if !orders.hasPreviousPage >disabled</#if>">
                <a class="page-link" href="?page=${orders.currentPageNumber - 1}${pageSubmissionUrl}" tabindex="-1">Previous</a>
            </li>
            <#list 1..orders.totalPageNumber as pageNumber>
                <li class="page-item <#if orders.currentPageNumber == pageNumber>active</#if>">
                    <a class="page-link" href="?page=${pageNumber}${pageSubmissionUrl}">${pageNumber}</a>
                </li>
            </#list>
            <li class="page-item <#if !orders.hasNextPage >disabled</#if>">
                <a class="page-link" href="?page=${orders.currentPageNumber + 1}${pageSubmissionUrl}" tabindex="-1">Next</a>
            </li>
        </ul>
<#else>
    <#if name??>
        <h1 class="text-center font-italic font-weight-bold font-family text-primary">Замовлення із цим ім'ям немає в
            архіві.</h1>
    <#else>
        <h1 class="text-center font-italic font-weight-bold font-family text-primary">Архів пустий.</h1>
    </#if>
</#if>

<#include "../animal/footer.ftl">
