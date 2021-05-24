# Memorize (найди пару) проект для защиты
Медленно, но настойчиво погружаемся в декларативное описание UI, которое проповедует SwiftUI.

- Игра (логика, подсчет очков)
    - Каждую игру рандомные карточки
    - счет с бонусами(не работает - переделать) 
- Меню (side bar menu)
- Уведомления (+ анимация)
    - Запрос requestAuthorization [.alert, .badge, .sound]
    - UNMutableNotificationContent - Создание содержимого для локального уведомления
    - ScenePhase - жизненный цикл SwiftUI
    - Реализация UNUserNotificationCenterDelegate без AppDelegate в SwiftUI
    - Запоминаем установлен ил будильник
    <img src="https://github.com/ihValery/Notification/blob/main/Notification.png?raw=true"></a>
- Помощь (onboarding с правилами и описанием)
    - Переделать! (реализовать максимум)
- Выбор темы
    - анимированные карточки
    - сохранение текущей темы в UserDefaults
    - реактивный UI (выбирая тему - View везде перерисовывает цвет)
    <img src="https://github.com/ihValery/Memorize/blob/main/Memorize/ImageForReadme/previewApp.png?raw=true"></a> <img src="https://github.com/ihValery/Memorize/blob/main/Memorize/ImageForReadme/NewTheme75.gif?raw=true"></a>
