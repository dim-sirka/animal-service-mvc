<#include "../header.ftl">
<div class="container">
    <div class="card mb-2">
        <div class="row justify-content-center mt-2">
            <form action="/api/animals/update" method="post" autocomplete="off">
                <h3 class="text-center font-italic font-weight-bold font-family">Зміна параметрів тварини!</h3>
                <div class="col-12 block pt-5">
                    <table class="table table-hover mb-0">
                        <tbody>
                        <fieldset>
                            <label>Id:</label>
                            <input type="text" name="id" value="${animal.id}" readonly>
                        </fieldset>
                        <fieldset>
                            <label>Ім'я тварини:</label>
                            <input type="text" name="name" value="${animal.name}">
                        </fieldset>
                        <fieldset>
                            <label>Вік тварини:</label>
                            <input type="text" name="age" value="${animal.age}">
                        </fieldset>
                        <fieldset>
                            <label class="" scope="row">Тип тварини:</label>
                                    <select class="select-program col-md-5" name="animalType"   required>
                                        <option name="animalType"  selected>${animal.animalType}</option>
                                        <option>DOG</option>
                                        <option>CAT</option>
                                        <option>OTHER</option>
                                    </select>
                        </fieldset>
                        <fieldset>
                            <label>Опис тварини:</label>
                            <input type="text" name="description" value="${animal.description}">
                        </fieldset>
                        <fieldset>
                            <label>Посилання на фото:</label>
                            <input type="text" name="mediaLinks" value="${animal.mediaLinks}">
                        </fieldset>
                        </tbody>
                        <fieldset class="row justify-content-center tm-10">
                            <div class="col-4 btn btn-primary text-center submitBtn">
                                <a href="/api/animals/${animal.id}" style="color: white">Скасувати</a>
                            </div>
                            <button name="Submit" type="submit" class="col-4 btn btn-primary text-center submitBtn" data-submit="...Sending">
                                Зберегти
                            </button>

                        </fieldset>
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>
<#include "../footer.ftl">

