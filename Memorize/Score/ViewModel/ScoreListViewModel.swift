//
//  ScoreListViewModel.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 28.06.21.
//

import Foundation
import Combine

class ScoreListViewModel: ObservableObject {
    @Published private var repository = ScoreRepository()
    @Published var scoreViewModels: [ScoreViewModel] = []
    private var cancellabel: Set<AnyCancellable> = []
    
    init() {
        repository.$scores.map { scores in
            scores.map(ScoreViewModel.init)
        }
        .assign(to: \.scoreViewModels, on: self)
        .store(in: &cancellabel)
    }
    
    func add(theme: String, number: String) {
        guard let number = Int(number) else { return }
        
        guard let currentIndex = searchIndex(theme: theme) else {
            let newScore = Score(theme: theme, maxScore: number)
            repository.add(newScore)
            return
        }
        newScoreLargetOld(number: number, index: currentIndex)
    }
    
    private func update(_ score: Score) {
        repository.update(score)
    }
    
    private func newScoreLargetOld(number: Int, index: Int) {
        if number > scoreViewModels[index].score.maxScore {
            var updateScore = scoreViewModels[index].score
            updateScore.maxScore = number
            updateScore.date = Date()
            update(updateScore)
        }
    }
    
    private func searchIndex(theme: String) -> Int? {
        for index in 0..<scoreViewModels.count {
            if scoreViewModels[index].score.theme == theme {
                return index
            }
        }
        return nil
    }
}
