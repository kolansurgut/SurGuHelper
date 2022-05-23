token = 'aeeb5f51e0be54d84d32e29ff4a2c5bd85c326051d8ff0403835c30b3723fc1c45fe2c3a740d5b57dfd0a'
group_id = -207094965
port = 3306
host = "sitenk03.beget.tech"
user = "sitenk03_surgu"
password = "127912mamA"
database = 'sitenk03_surgu'

list_keyboards = \
    {
        "начать": [False, [['Неделя', 'SECONDARY', False],
                           ['Кафедры', 'SECONDARY', False],
                           ['Погода', 'SECONDARY', True],
                           ['Расписание пар', 'PRIMARY', False],
                           ['Расписание звонков', 'PRIMARY', True],
                           ['Информация о корпусах', 'SECONDARY', True],
                           ['Поиск сотрудника', 'PRIMARY', False],
                           ['Карта СурГу', 'PRIMARY', True],
                           ['Закрыть клавиатуру', 'NEGATIVE', False]]],

        'карта сургу': [False, [['Главный', 'SECONDARY', False],
                                ['Уникит', 'SECONDARY', True],
                                ['Административный', 'PRIMARY', True],
                                ['Гуманитарный', 'SECONDARY', False],
                                ['Спортивный', 'SECONDARY', True],
                                ['Назад', 'NEGATIVE', False]]],

        'кафедры': [False, [['Государства и права', 'SECONDARY', True],
                            ['Гуманитарного образования и спорта', 'PRIMARY', True],
                            ['Естественных и технических наук', 'SECONDARY', True],
                            ['Экономики и управления', 'PRIMARY', True],
                            ['Медицинский', 'SECONDARY', False],
                            ['Политехнический', 'SECONDARY', True],
                            ['Назад', 'NEGATIVE', False]]],

        'поиск сотрудника': [False, [['Поиск по имени', 'PRIMARY', False],
                                     ['Поиск по должности', 'PRIMARY', True],
                                     ['Назад', 'NEGATIVE', False]]],

        'совпадения': [False, [['Показать одно', 'PRIMARY', False],
                               ['Показать пять', 'PRIMARY', True],
                               ['Показать десять', 'SECONDARY', False],
                               ['Отмена', 'NEGATIVE', False]]]
    }

institute_dict = {
                                'государства и права': 1,
                                'гуманитарного образования и спорта': 2,
                                'естественных и технических наук': 3,
                                'экономики и управления': 4,
                                'медицинский': 5,
                                'политехнический': 6}

maps = \
    {
        "главный": ["главный/этаж1.jpg", "главный/этаж2.jpg", "главный/этаж3.jpg"],

        "уникит": ["уникит/этаж1.jpg", "уникит/этаж2.jpg", "уникит/этаж3.jpg"],

        "административный": ["административный/этаж1.jpg", "административный/этаж2.jpg", "административный/этаж3.jpg"],

        "гуманитарный": ["гуманитарный/этаж1.jpg", "гуманитарный/этаж2.jpg", "гуманитарный/этаж3.jpg"],

        "спортивный": ["спортивный/этаж1.jpg", "спортивный/этаж2.jpg"]
    }
