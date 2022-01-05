//
//  ScoreTableMainView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableMainView: View {
    
    //MARK: Properties
 
    @Binding var onAnimation: Bool

    @ObservedObject var session: SessionFirebase
    
    @ObservedObject private var theme = ThemeViewModel.shared
    @ObservedObject private var scoreListViewModel = ResultsTableViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { gr in
                    ScrollView {
                        ForEach(scoreListViewModel.scoreViewModels) { item in
                            CardScoreView(scoreViewModel: item)
                                .offset(y: onAnimation ? 0 : getScreeSize().height)
                        }
                        .offset(y: 25)
                    }
                    .frame(height: gr.size.height - 165)
                }
                .offset(y: 170)
            }
            
            ZStack {
                ScoreBackgroundWithBubbleView()
                
                VStack {
                    HeaderScoreView(isAnimation: $onAnimation, session: session)
                        .frame(height: getScreeSize().height / 6)
                        .padding(.top, 70)
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
    
}

struct ScoreTableMainView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableMainView(onAnimation: .constant(true), session: SessionFirebase())
    }
}
