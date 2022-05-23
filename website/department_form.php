<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">

            <form method="post">

                <div class="form-group">
                    <label for="department">Название кафедры</label>
                    <input type="text" class="form-control" id="department" name="department">
                </div>

                <div class="form-group">
                    <label for="phone">Номер телефона кафедры</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                </div>

                <div class="form-group">
                    <label for="email">Email кафедры</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>

                <div class="form-group">
                    <label for="website">Сайт кафедры</label>
                    <input type="text" class="form-control" id="website" name="website">
                </div>

                <div class="form-group">
                    <label for="office">Кабинет кафедры</label>
                    <input type="text" class="form-control" id="office" name="office">
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="index.php">Назад</a>
            </form>

        </div>
    </div>
</div>

<?php

require_once 'data.php';
require_once 'functions.php';

if(!empty($_POST)){
    debug($_POST);
    $fields = load($fields_department);
    debug($fields);
    if($errors = validate($fields)){
        debug($errors);
    }else{
        echo 'OK';
    }

    echo "Форма успешно отправлена!";
}?>

</body>
</html>