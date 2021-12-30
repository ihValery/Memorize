//
//  ScoreViewModel.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 28.06.21.
//

import Foundation
import Combine

class ScoreViewModel: ObservableObject, Identifiable {
    private let repository = ScoreRepository()
    @Published var score: Score
    //cancellables используется для хранения ваших подписок, чтобы вы могли отменить их позже.
    private var cancellabel: Set<AnyCancellable> = []
    var id = ""
    
    init(score: Score) {
        self.score = score
        //Настройте привязку score между карточкой id и моделью представления id.
        //Затем сохраните объект cancellables чтобы его можно было отменить позже.
        $score
            .compactMap { $0.id }
            //Результат этого преобразования затем используется  подписчиком  assign, который — как следует из названия — назначает полученное значение
            .assign(to: \.id, on: self)
            .store(in: &cancellabel)
    }
    
    func remove() {
        repository.remove(score)
    }
    
    func dateToString() -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd/MM/y  HH:mm"
        return timeFormatter.string(from: score.date)
    }
}
