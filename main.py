import keep_alive
import vk_api
from vk_api.longpoll import VkLongPoll, VkEventType
from vk_api.utils import get_random_id
from vk_api.keyboard import VkKeyboard, VkKeyboardColor
from pyowm import OWM
import datetime
import pymysql
from config import token, maps, list_keyboards
from MySQL_config import MySQL_config
import os

token = token
vk_session = vk_api.VkApi(token=token)
session_api = vk_session.get_api()

database = MySQL_config()
department_bd = database.output("department")
teacher_bd = database.output("teacher")


def weather_manager():
    owm = OWM('fd28431ded597cbba3fbe85afeae4de5')
    manager = owm.weather_manager()
    observation = manager.weather_at_place('Сургут, ru')
    weather = observation.weather
    # температура
    temps = weather.temperature('celsius')
    temp = temps['temp']
    feels_like = temps['feels_like']
    # ветер
    wind_speed = weather.wind()['speed']
    # влажность
    humidity = weather.humidity
    # давление
    pressure = str(int(weather.pressure['press']) * 0.750064)[:6]
    return f'В Сургуте сейчас {temp}°С \n' \
           f'Ощущается как {feels_like}°С \n' \
           f'Ветер {wind_speed} м/с \n' \
           f'Влажность {humidity}% \n' \
           f'Давление {pressure} мм. рт. ст.'


def send_message(user_id, message=None, keyboard=None):
    try:
        vk_session.method('messages.send', {'user_id': user_id, 'message': message, 'random_id': get_random_id(),
                                            'keyboard': keyboard})
    except:
        print('send_message')


def send_photo(user_id, list_photo):
    try:
        list_attachment = []
        for photo in list_photo:
            upload = vk_api.VkUpload(vk_session)
            photo = upload.photo_messages(photo)
            owner_id = photo[0]['owner_id']
            photo_id = photo[0]['id']
            access_key = photo[0]['access_key']
            list_attachment.append(f'photo{owner_id}_{photo_id}_{access_key}')
        session_api.messages.send(peer_id=user_id, random_id=0, attachment=list_attachment)
        return True
    except FileNotFoundError:
        return False


def send_map(user_id, corpus):
    # send_photo(user_id, maps[corpus])
    send_message(user_id, 'Пока ничем не могу помочь(')


def user_in_bd(user_id, database):
    try:
        user_bd = database.output("user")
        try:
            database.insert("user", "(id)", f"('{user_id}')")
        except pymysql.err.IntegrityError:
            pass
        for colm in user_bd:
            if str(user_id) == colm['id']:
                return int(user_bd.index(colm))
    except:
      print('user_in_bd')


def calling_keyboard(msg):
    try:
        if msg == 'закрыть клавиатуру':
            keyboard = VkKeyboard(one_time=False)
            return keyboard.get_empty_keyboard()
        if msg in list_keyboards:
            return create_keyboard(list_keyboards[msg])
    except:
        print('calling_keyboard')


def create_keyboard(list_button):
    try:
        bool = list_button[0]
        keyboard = VkKeyboard(one_time=bool)
        for button in list_button[1]:
            keyboard.add_button(button[0], color=property_color(button[1]))
            if button[2]:
                keyboard.add_line()
        keyboard = keyboard.get_keyboard()
        return keyboard
    except:
        print('create_keyboard')


def property_color(color):
    try:
        if color == 'PRIMARY':
            color = VkKeyboardColor.PRIMARY
        elif color == 'SECONDARY':
            color = VkKeyboardColor.SECONDARY
        elif color == 'POSITIVE':
            color = VkKeyboardColor.POSITIVE
        elif color == 'NEGATIVE':
            color = VkKeyboardColor.NEGATIVE
        return color
    except:
        print('property_color')


def main():
    try:
        while True:
            for event in VkLongPoll(vk_session).listen():
                if event.type == VkEventType.MESSAGE_NEW and not event.from_me and event.from_user:
                    user_id = event.user_id
                    msg = event.text.lower()
                    keyboard = calling_keyboard(msg)
                    index = user_in_bd(user_id, database)

                    if msg == 'старт':
                        send_message(user_id, 'Привет! \n'
                                              'Я твой помощник по СурГу. \n'
                                              'Напиши "Начать", чтобы узнать, \n'
                                              'чем я могу тебе помочь.')
                    elif msg == 'начать':
                        send_message(user_id, 'Что тебя интересует?', keyboard)

                    elif msg == 'погода':
                        send_message(user_id, weather_manager())

                    elif msg == 'карта сургу':
                        send_message(user_id, 'Какой корпус тебя интересует?', keyboard)

                    elif msg == 'кафедры':
                        send_message(user_id, 'Выбери институт, а затем напиши номер кафедры, \nкоторая вас интересует.',
                                    keyboard)

                    elif msg == 'неделя':
                        today = datetime.date.today()
                        september = datetime.date(2021, 8, 30)
                        delta = today - september
                        week = delta.total_seconds() / 3600 / 24 / 7
                        if week % 2 < 1:
                            send_message(user_id, f'{int((week // 1) + 1)} неделя: Числитель')
                        else:
                            send_message(user_id, f'{int((week // 1) + 1)} неделя: Знаменатель')

                    elif msg == 'расписание пар':
                        send_message(user_id, 'Напишите вашу группу, например 420-12')

                    elif msg == 'расписание звонков':
                        send_message(user_id, 'Рассписание в корпусах\n'
                                              '"К", "У", "А", "Г" и бассеине:\n'
                                              '\n'
                                              '1 пара) 08:00-09:30\n'
                                              '2 пара) 09:40-11:10\n'
                                              '3 пара) 11:20-12:50\n'
                                              '4 пара) 13:20-14:50\n'
                                              '5 пара) 15:00-16:30\n'
                                              '6 пара) 16:40-18:10\n'
                                              '7 пара) 18:20-19:50\n'
                                              '8 пара) 20:00-21:30\n'
                                              '\n'
                                              'Расписание в спортивном\n'
                                              'комплексе "Дружба":\n'
                                              '\n'
                                              '1 пара) 08:30-10:00\n'
                                              '2 пара) 10:10-11:40\n'
                                              '3 пара) 11:50-13:20\n'
                                              '4 пара) 13:30-15:00\n'
                                              '5 пара) 15:05-16:35\n')

                    elif msg == 'информация о корпусах':
                        send_message(user_id, 'Корпус "К" - Главный(корабль):\n'
                                              'пр.Ленина, д.1\n'
                                              '\n'
                                              'Корпус "У" - Уникит:\n'
                                              'Ул.Энергетиков, д.22\n'
                                              '\n'
                                              'Корпус "А" - Административный:\n'
                                              'Ул.Энергетиков, д.22\n'
                                              '\n'
                                              'Корпус "Г" - Гуманитарный:\n'
                                              'Ул.Энергетиков, д.8\n'
                                              '\n'
                                              'Корпус "С" - Спортивный комплекс "Дружба":\n'
                                              'Ул.50 лет ВЛКСМ, д.9А\n'
                                              '\n'
                                              'Бассеин "Водолей":\n'
                                              'Ул.30 лет Победы, д.22А')

                    elif len(msg) == 6 and \
                            len(msg.split('-')) == 2 and \
                            len("".join("".join(msg.split('-')).split(' '))) == 5 and \
                            len(msg.split('-')[1]) == 2:
                        if not send_photo(user_id, [f'schedules/{msg}/{msg}.jpg']):
                            send_message(user_id, 'У меня нет такого расписания.')

                    elif msg == 'поиск сотрудника':
                        send_message(user_id, 'Напишите ФИО сотрудника полными словами. \n\n'
                                              'При незнании полных инициал пропустите слово.\n\n'
                                              'Не допускается поиск по "Фамилия Отчество".')

                    elif msg == 'закрыть клавиатуру':
                        send_message(user_id, 'Напиши "Начать",\n'
                                              'чтобы продолжить.', keyboard)

                    elif msg == 'назад':
                        send_message(user_id, 'Прошу.', calling_keyboard('начать'))

                    elif msg in ['государства и права',
                                 'гуманитарного образования и спорта',
                                 'естественных и технических наук',
                                 'экономики и управления',
                                 'медицинский',
                                 'политехнический']:
                        database.editing('user', f"institute = '{msg}'", f"id = '{user_id}'")
                        user_bd = database.output("user")
                        department_output = f'Институт {msg}:\n\n'
                        for department in department_bd:
                            if department['institute'] == msg:
                                department_output += f'{department["num"]}) {department["department"]}\n\n'
                        send_message(user_id, department_output)

                    elif msg in ['главный',
                                 'уникит',
                                 'административный',
                                 'гуманитарный',
                                 'спортивный']:
                        send_map(user_id, msg)

                    else:
                        status = False
                        if len(msg) <= 2 and '0' < msg <= '9':
                            user_bd = database.output("user")
                            for department in department_bd:
                                if user_bd[index]['institute'] == department['institute'] and str(department['num']) == msg:
                                    send_message(user_id, f"Институт {department['institute']}:\n\n"
                                                          f"{department['department']}\n\n:"
                                                          f"E-mail: {department['e-mail']}\n\n"
                                                          f"Телефон: {department['number']}\n\n"
                                                          f"Страница на сайте СурГу:\n"
                                                          f"{department['http']}\n\n"
                                                          f"Кабинет: {department['office']}")
                                    status = True
                        if not status:
                            teacher_bd = database.coincidence('teacher', 'name', msg)
                            if teacher_bd:
                                for teacher in teacher_bd:
                                    send_message(user_id, f'{teacher["name"]}\n\n'
                                                          f'Институт {teacher["institute"]}\n\n'
                                                          f'Кафедра {teacher["department"]}\n\n'
                                                          f'Должность: {teacher["post"]}\n\n'
                                                          f'Телефон: {teacher["number"]}\n\n'
                                                          f'Почта: {teacher["e-mail"]}')
                                status = True
                        if not status:
                            send_message(user_id, 'Ничем не могу помочь.', keyboard)
    except:
        print('main')


if __name__ == "__main__":
    keep_alive.keep_alive()
    token = os.environ.get("Token")
    main()
