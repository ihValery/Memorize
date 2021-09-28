//
//  ScoreTableViewMain.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableViewMain: View {
    @ObservedObject var theme = ThemeSettings.shared
    @ObservedObject var session: SessionFirebase
    @ObservedObject var scoreListViewModel = ScoreListViewModel()
    
    @Binding var onAnimation: Bool
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { gr in
                    ScrollView {
                        ForEach(scoreListViewModel.scoreViewModels) { item in
                            OneCardScore(scoreViewModel: item)
                                .offset(y: onAnimation ? 0 : getRect().height)
                            //
//                                .animation(.ripple(index: 1).delay(1))
                        }
                        .offset(y: 25)
                    }
                    .frame(height: gr.size.height - 165)
                }
                .offset(y: 170)
            }
                            //
//                            .offset(x: onAnimation ? 0 : getRect().height)
//                            .animation(.easeInOut(duration: 1))
            
            ZStack {
                RRAnglePlusBubble()
                
                VStack {
                    Header(session: session, isAnimation: $onAnimation)
                        .frame(height: getRect().height / 6)
                        .padding(.top, 70)
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableViewMain(session: SessionFirebase(), onAnimation: .constant(true))
    }
}
