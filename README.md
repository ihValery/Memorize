# Memorize написан на SwiftUI
 - CS193p Стэнфордский курс
 - Медленно, но настойчиво погружаемся в декларативное описание UI, которое проповедует SwiftUI

- Lesson 1
    - Познакомились c: (var body: some View) (ZStack) (ForEach) (HStack).
    - Создали структуру для одной карты struct CardView: View.

- Lesson 2
    - Проработали MVVM, создали пресловутую "стклянную дверь" что бы View всегда отображала Model.
    - Замыкания - пишем функцию, а потом переносим (менем { на in) сокращаем синтаксис и все красиво.
    - Generic struct с “Не важно, какой” ТИПом.
    - Протокол Identifiable (значение объекта со стабильной идентичностью) для ForEach.
    - Static функция — это функция ТИПА EmojiMemoryGame, а НЕ функция экземпляра класса.
    - Функциональное программирование - передаем множество функций как аргументы других функций