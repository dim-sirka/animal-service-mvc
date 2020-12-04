<#include "../header.ftl">
<h1 class="text-center font-italic font-weight-bold font-family">Список замовлень!</h1>
<div class="row">
    <div class="input-group col text-center">
        <form action="/order/find" class="form-inline mx-auto">
            <#if name??>
                <a href="/list/orders" class="btn btn-secondary m-1">Reset</a>
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
<div>
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
                <td class="col-3"><a href="/api/animals/?name=${order.animal.name}">${order.animal.name}</a></td>
                <td class="col-2">${order.userPhoneNumber}</td>
                <td class="col-2">${order.userName}</td>
                <#if order.orderStatus == "PENDING">
                    <th class="col-4 text-center">
                        <a href="/confirm/${order.id}">
                            <button class="btn btn-success" type="submit">Підтвердити</button>
                        </a>
                        <a href="/cancel/${order.id}">
                            <button class="btn btn-danger" type="submit">Скасувати</button>
                        </a>
                    </th>
                <#elseif order.orderStatus == "CONFIRMED">
                    <th class="col-4 text-center">
                            <button class="btn btn-success" type="submit" disabled>Підтверджено</button>
                    </th>
                <#elseif order.orderStatus == "CANCELED">
                    <th class="col-4 text-center" >
                            <button class="btn btn-danger" type="submit" disabled>Скасовано</button>
                    </th>
                </#if>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
<div class="row justify-content-center">
    <ul class="pagination">
        <li class="page-item  <#if !orders.hasPreviousPage >disabled</#if>">
            <a class="page-link" href="?page=${orders.currentPageNumber - 1}" tabindex="-1">Previous</a>
        </li>
        <#list 1..orders.totalPageNumber as pageNumber>
            <li class="page-item <#if orders.currentPageNumber == pageNumber>active</#if>">
                <a class="page-link" href="?page=${pageNumber}">${pageNumber}</a>
            </li>
        </#list>
        <li class="page-item <#if !orders.hasNextPage >disabled</#if>">
            <a class="page-link" href="?page=${orders.currentPageNumber + 1}" tabindex="-1">Next</a>
        </li>
    </ul>
</div>


<#include "../footer.ftl">