<?php
    session_start();
    require_once ('connect.php');
?>
<!doctype html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>SurGUHelper</title>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <?php
        require_once ('header.php');
    ?>
    <body>
        <div class="speech">
            <p class="appeal">
                Приветствуем вас, друзья!<br>
                Мы создатели этого бота.<br>
            </p>
            <p class="purpose">
                Цель нашего проекта, это помочь всем первокурсникам и не только<br>
                с их вопросами по поводу Сургутского государственного университета.<br>
                Есть много информации, которую мы бы хотели видеть в нашем боте, но увы,<br>
                парочке энтузиастов сложно собрать информацию со всего института,<br>
                поэтому мы просим вас о помощи.<br>
            </p>
            <p class="request">
                Если вы владеете какой либо информацией о преподавателях или кафедрах,<br>
                которой еще нет в боте, то, пожалуйста, заполните соответствующую форму на сайте.<br>
            </p>
            <p class="thank">
                Заранее благодарим! <br>Вместе мы сможем собрать хорошую и полезную базу данных!
            </p>
        </div>

    </body>
</html>
