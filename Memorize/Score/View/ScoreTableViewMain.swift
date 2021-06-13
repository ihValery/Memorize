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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [themeData[theme.current].color.opacity(0.6), .purpleTheme]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                BubbleBlowerAnimation(color: themeData[theme.current].color, positionY: 250, frameCircle: 50...200)
                    .drawingGroup()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 250)
                Spacer()
            }
            
            ZStack {
                VStack {
                    Header(session: session)
                        .frame(height: getRect().height / 6)
                        .padding(.top, 30)
                    Spacer()
                }
                
                Group {
                    RectangleReverseAngle(startY: 125).fill(Color.white)
                        .edgesIgnoringSafeArea([.horizontal, .bottom])
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(scoreData) { item in
                                OneCardScore(name: item.theme, result: item.score, date: item.date)
                            }
                        }
                    }
                    .frame(height: getRect().height * 4 / 6)
                    .offset(y: 120)
                }
            }
        }
    }
}

struct ScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableViewMain(session: SessionFirebase())
    }
}
