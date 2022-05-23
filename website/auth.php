<?php

$client_id = 8174415; // ID приложения
$client_secret = 'oT2DMMv9HjYxX8S4IV3L'; // Защищённый ключ
$redirect_uri = 'http://sitenk03.beget.tech/index.php'; // Адрес сайта

$url = 'http://oauth.vk.com/authorize'; // Ссылка для авторизации на стороне ВК

$params = [ 'client_id' => $client_id, 'redirect_uri'  => $redirect_uri, 'response_type' => 'code']; // Массив данных, который нужно передать для ВК содержит ИД приложения код, ссылку для редиректа и запрос code для дальнейшей авторизации токеном

if (isset($_GET['code'])) {
    $result = true;
    $params = [
        'client_id' => $client_id,
        'client_secret' => $client_secret,
        'code' => $_GET['code'],
        'redirect_uri' => $redirect_uri
    ];

    $token = json_decode(file_get_contents('https://oauth.vk.com/access_token' . '?' . urldecode(http_build_query($params))), true);

    if (isset($token['access_token'])) {
        $params = [
            'uids' => $token['user_id'],
            'fields' => 'uid,first_name,last_name,screen_name,sex,bdate,photo_big',
            'access_token' => $token['access_token'],
            'v' => '5.101'];

        $userInfo = json_decode(file_get_contents('https://api.vk.com/method/users.get' . '?' . urldecode(http_build_query($params))), true);
        if (isset($userInfo['response'][0]['id'])) {
            $userInfo = $userInfo['response'][0];
            $result = true;
        }
    }

}

if ($userInfo['first_name'])
    echo $userInfo['first_name']. "<br/>";

else
    echo $link = '<p><a href="' . $url . '?' . urldecode(http_build_query($params)) . '">VK_autorize</a></p>';


$_SESSION['id'] = $userInfo['id'];
?>
