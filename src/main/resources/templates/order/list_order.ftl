<#include "../header.ftl">
<h1 class="text-center font-italic font-weight-bold font-family">Список замовлень!</h1>
<div>
    <table border="2" class="table <#if orders??>table-dark <#else> table-striped </#if>">
        <thead class="<#if orders??>thead-light <#else> thead-dark </#if>">
        <tr class="d-flex">
            <th scope="col" class="col-1">ID</th>
            <th scope="col" class="col-3">Ім'я тварини</th>
            <th scope="col" class="col-2">Номер телефону</th>
            <th scope="col" class="col-2">Ім'я клієнта</th>
            <th class="col-4"></th>
        </tr>
        </thead>
        <tbody>
        <#list orders.content as order>
            <tr class="d-flex">
                <th scope="row" class="col-1">${order.id}</th>
                <td class="col-3"><a href="/api/animals/?name=${order.animal.name}">${order.animal.name}</a></td>
                <td class="col-2">${order.userPhoneNumber}</td>
                <td class="col-2">${order.userName}</td>
                <th class="col-4 text-center">
                    <a href="/confirm/${order.id}">
                        <button class="btn btn-warning" type="submit">Підтвердити</button>
                    </a>
                    <a href="/cancel/${order.id}">
                        <button class="btn btn-light" type="submit">Скасувати</button>
                    </a>
                </th>
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