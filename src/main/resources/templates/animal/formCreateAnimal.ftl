<#include "../header.ftl">
<div class="container">
    <div class="card mb-2">
        <div class="row justify-content-center mt-2">
            <form action="/admin/animals/new" method="post" autocomplete="off">
                <h3 class="text-center font-italic font-weight-bold font-family">Реєстрація тварини!</h3>
                <div class="col-11 block pt-5">
                    <table class="table table-hover mb-0">
                        <tbody>
                        <tr>
                            <th class="align-middle" scope="row">Ім'я тварини:</th>
                            <td class="td-padding">
                                <input name="name" placeholder=""
                                       type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle" scope="row">Вік тварини:</th>
                            <td class="td-padding">
                                <input name="age" placeholder="" value=""
                                       type="text" tabindex="2" />
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle" scope="row">Тип тварини:</th>
                            <td class="td-padding">
                                <select class="select-program col-md-12" name="animalType" required>
                                    <option name="animalType" disabled selected>Тип тварини:</option>
                                    <option>DOG</option>
                                    <option>CAT</option>
                                    <option>OTHER</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle" scope="row">Опис тварини:</th>
                            <td class="td-padding">
                                <input name="description" placeholder="" value=""
                                       type="text" tabindex="4">
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle" scope="row">Посилання на фото:</th>
                            <td class="td-padding">
                                <input name="mediaLinks" placeholder="" value=""
                                       type="text" tabindex="5">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <fieldset class="row justify-content-center tm-10">
                        <button name="Submit" type="submit" class="col-4 btn btn-primary text-center submitBtn" data-submit="...Sending">
                            Зберегти
                        </button>
                    </fieldset>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </div>
</div>
<#include "../footer.ftl">

