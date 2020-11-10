<#include "../header.ftl">
<script>
    function zoomPhoto() {
        var v = document.getElementById("info-image");
        v.className += "dblclick-info-image";
    }
</script>
<div class="container h-100">
    <div class="row justify-content-center">
                <div class="card mb-2">
                    <a href="/api/animals?animalStatus=${animal.animalStatus}" class="row ml-1">
                        <button class="btn btn-secondary text-center" type="submit">Назад</button>
                    </a>
                    <div class="row justify-content-center mt-2">
                            <div class="col-6 block">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" ondbclick="zoomPhoto()">
                                    <ol class="carousel-indicators">
                                        <#list animal.mediaLinks as link>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="${link_index}"
                                                class="${(link?counter == 1)?then('active', '')}">
                                            ></li>
                                        </#list>
                                    </ol>
                                    <div class="carousel-inner">
                                        <#list animal.mediaLinks as link>
                                             <div class="carousel-item ${(link?counter == 1)?then('active', '')}">
                                                 <img class="card-img-top card-item-img-info"  id="info-image" src="${link}">
                                             </div>
                                        </#list>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>

                                <h4 class="card-title text-center">${animal.name}</h4>
                            </div>
                            <div class="col-9 block pt-5">
                                <table class="table table-hover mb-0">
                                    <tbody>
                                    <tr>
                                        <th class="align-middle" scope="row">Опис:</th>
                                        <td class="td-padding">${animal.description}</td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle" scope="row">Вік:</th>
                                        <td class="td-padding">${animal.age}</td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle" scope="row">Вид:</th>
                                        <td class="td-padding">${animal.animalType}</td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle" scope="row">Дата створення:</th>
                                        <td class="td-padding">${animal.createdDate}</td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle" scope="row">Статус:</th>
                                        <td class="td-padding">${animal.animalStatus}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                    </div>
                    <a href="api/orders/new/${animal.id}" class="row justify-content-center tm-10">
                        <button class="col-4 btn btn-primary text-center" type="submit">Створити замовлення</button>
                    </a>
            </div>
    </div>
</div>
<#include "../footer.ftl">