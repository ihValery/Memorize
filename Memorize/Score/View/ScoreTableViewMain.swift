//
//  ScoreTableViewMain.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableViewMain: View {
    @State private var isAnimation = false
    @ObservedObject var theme = ThemeSettings.shared
    @ObservedObject var session: SessionFirebase
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purpleTheme, themeData[theme.current].color]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                BubbleBlowerAnimation(color: themeData[theme.current].color, positionY: 250, frameCircle: 50...200)
                    .drawingGroup()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 250)
                    .opacity(0.5)
                Spacer()
            }
            
            ZStack {
                VStack {
                    Header(isAnimation: $isAnimation, session: session)
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
                                    .offset(y: isAnimation ? 0 : getRect().height)
                                    .animation(isAnimation ? .ripple(index: item.id).delay(1) : .none)
                            }
                        }
                    }
                    .frame(height: getRect().height * 4 / 6)
                    .offset(y: 120)
                }
                .offset(x: isAnimation ? 0 : getRect().height)
                .animation(.easeInOut(duration: 1))
            }
        }
        .onAppear {
            print("Мы появились - ScoreTableViewMain - isAnimation = \(isAnimation)")
            isAnimation = true
        }
        .onDisappear {
            print("Мы выгрузились - ScoreTableViewMain - isAnimation = \(isAnimation)")
            isAnimation = false
        }
    }
}

struct ScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableViewMain(session: SessionFirebase())
    }
}
