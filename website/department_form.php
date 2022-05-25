<?php
    session_start();
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

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">

            <form method="POST">

                <div class="form-group">
                    <label for="department">Название кафедры<br></label>
                    <input type="text" class="form-control" id="department" name="department">
                </div>

                <div class="form-group">
                    <label for="phone">Номер телефона кафедры<br></label>
                    <input type="text" class="form-control" id="phone" name="phone">
                </div>

                <div class="form-group">
                    <label for="email">Email кафедры<br></label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>

                <div class="form-group">
                    <label class="label" for="website">Сайт кафедры<br></label>
                    <input type="text" class="form-control" id="website" name="website">
                </div>

                <div class="form-group">
                    <label for="office">Кабинет кафедры<br></label>
                    <input type="text" class="form-control" id="office" name="office">
                </div>

                <button class="send_btn" type="submit">Отправить</button>
                <a class="back_btn" href="index.php">Назад</a>
            </form>

        </div>
    </div>
</div>

<?php

require_once ('connect.php');
require_once 'data.php';
require_once 'functions.php';

if(!empty($_POST)){
    $connect->query("INSERT INTO `editing_department` (`department`, `phone`, `email`, `website`, `office`) VALUES('".$_POST['department']."', '".$_POST['phone']."', '".$_POST['email']."', '".$_POST['website']."', '".$_POST['office']."')");

//    debug($_POST);
//    $fields = load($fields_department);
//    debug($fields);
//    if($errors = validate($fields)){
//        debug($errors);
//    }else{
//        echo 'OK';
//    }

//    echo "Форма успешно отправлена!";
}?>

</body>
</html>