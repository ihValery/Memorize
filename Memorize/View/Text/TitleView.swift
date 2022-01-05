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
    
    private let paddingLeading: CGFloat = 60
    private let paddingBottom: CGFloat = -1
    private var paddingTop: CGFloat {
        isWithBangs ? -5 : -1
    }
    
    //MARK: Initializer
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(Constant.Opacity.forty))
                .padding(.leading, paddingLeading)
                .padding(.top, paddingTop)
                .padding(.bottom, paddingBottom)
            
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView("Title")
    }
}
