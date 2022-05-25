<?php
    session_start()
?>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>SurGUHelper</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<header>
    <img class="logo_surgu" src="/website/img/logo_surgu.png">
    <ul>
        <li class="surgu_text"><a class="link" href="index.php">SurGUHelper</a></li>
        <li class="surgu_text_down"><a class="link" href="index.php">ваш бот-помощник</a></li>
    </ul>
    <div class="forms">
        <a class="form" href="department_form.php"">Кафедры</a>
    </div>
    <div class="forms">
        <a class="form" href="teacher_form.php"">Преподаватели</a>
    </div>
    <?php
    if ($_SESSION['first_name'])
        echo $link = '<a class="vk_autorize" href="">'. $_SESSION['first_name'] .'</a>';
    else
        require_once ('auth.php');
    ?>
</header>
</html>