//
//  FrameAvatar.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct FrameAvatar: View {
    @Binding var image: UIImage
    
    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 200, maxHeight: 200)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.orangeGradientEnd, lineWidth: 1))
    }
}
