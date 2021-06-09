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
            .background(Color.white
                            .overlay(Text("Выберите\n фото")
                                        .foregroundColor(.orangeGradientEnd)
                                        .font(.title2)
                                        .opacity(0.7)))
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Color.orangeGradientEnd, lineWidth: 2)
                        .opacity(0.7))
            .multilineTextAlignment(.center)
    }
}
