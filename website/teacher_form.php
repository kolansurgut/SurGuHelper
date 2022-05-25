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

            <form method="post">

                <div class="form-group">
                    <label for="name">ФИО преподавателя</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>

                <div class="form-group">
                    <label for="institute">Институт преподавателя</label>
                    <input type="text" class="form-control" id="institute" name="institute">
                </div>

                <div class="form-group">
                    <label for="department">Кафедра преподавателя</label>
                    <input type="text" class="form-control" id="department" name="department">
                </div>


                <div class="form-group">
                    <label for="phone">Номер телефона преподавателя</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                </div>

                <div class="form-group">
                    <label for="email">Email преподавателя</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>

                <div class="form-group">
                    <label for="post">Должность преподавателя в институте</label>
                    <input type="text" class="form-control" id="post" name="post">
                </div>

                <button class="send_btn">Отправить</button>
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
    $connect->query("INSERT INTO `editing_teacher` (`name`, `institute`, `department`, `phone`, `email`, `post`) VALUES('".$_POST['name']."', '".$_POST['institute']."', '".$_POST['department']."', '".$_POST['phone']."', '".$_POST['email']."',  '".$_POST['post']."')");

    //    debug($_POST);
//    debug($_POST);
//    $fields = load($fields_teacher);
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