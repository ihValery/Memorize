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
            ScrollView {
                LazyVStack {
                    ForEach(scoreListViewModel.scoreViewModels) { item in
                        OneCardScore(scoreViewModel: item)
//                                .offset(y: onAnimation ? 0 : getRect().height)
//                                    .animation(.ripple(index: Int(item.id)).delay(1))
                    }
                }
            }
            .offset(y: 100)
            .frame(height: getRect().height - 220)
            
//                .offset(x: onAnimation ? 0 : getRect().height)
//                .animation(.easeInOut(duration: 1))
            
            
            
            ZStack {
//                RectangleReverseAngle(startY: 165).fill(Color.white)
                RectangleReverseAngle(startY: 165)
                    .fill(LinearGradient(gradient: Gradient(colors: [themeData[theme.current].color.opacity(0.6), .purpleTheme]), startPoint: .topTrailing, endPoint: .bottomLeading))
//                VStack {
//                    BubbleBlower(color: themeData[theme.current].color, positionY: 250, frameCircle: 50...200)
//                        .drawingGroup()
//                    Spacer()
//                }

                
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
