//
//  TitleView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 05.01.2022.
//

import SwiftUI

//MARK: TitleView

struct TitleView: View {
    
    //MARK: Properties
    
    let title: String
    
    //MARK: Initializer
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.4))
                .padding(.leading, 60)
                .padding(.top, isWithBangs ? -5 : -1)
                .padding(.bottom, -1)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView("Title")
    }
}
