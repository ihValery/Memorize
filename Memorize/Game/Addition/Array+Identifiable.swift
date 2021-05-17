//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.05.21.
//  Обычно называем по имени того, что расширяем, плюс некоторое описание того, что делается в этом расширении.

import Foundation

extension Array where Element: Identifiable {
    ///Ищем индекс выбранного элемента в массиве, и как только нашли первый подходящий, то возвращаем его индекс.
    func firstIndex(selected: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == selected.id {
                return index
            }
        }
        return nil
    }
}
