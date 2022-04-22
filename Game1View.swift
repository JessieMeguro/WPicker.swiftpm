//
//  Game1View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 22/04/22.
//

import Foundation
import SwiftUI

struct Game1View: View {
    
    @State var imageArray: [(imageName: String, position: CGPoint, isImageVisible: Bool)] = [("sacola1", CGPoint(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 3.5 / 5), true), ("tampa1", CGPoint(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 4.2 / 5), true), ("tampa2", CGPoint(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 2.5 / 5), true ), ("bottle1", CGPoint(x: UIScreen.main.bounds.width * 4.5 / 5, y: UIScreen.main.bounds.height * 2.5 / 5), true), ("bottle2", CGPoint(x: UIScreen.main.bounds.width * 1.5 / 5, y: UIScreen.main.bounds.height * 3.1 / 5), true), ("food1", CGPoint(x: UIScreen.main.bounds.width * 2.9 / 5, y: UIScreen.main.bounds.height * 2.9 / 5), true)
        ]
    
    @State var isDragging = false
    @State var position = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Image("fundoJogo1")
                .resizable()
                .scaledToFill()
            
            GeometryReader { geo in
                
                ForEach(Array(imageArray.enumerated()), id: \.0) { index, image in
                    Image(image.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .opacity(image.isImageVisible ? 1 : 0)
                        .animation(.linear)
                        .frame(width: geo.size.width * 0.12, height: geo.size.height * 0.09)
                        .offset(x: position.width, y: position.height)
                        .position(image.position)
                        .onTapGesture {
                            withAnimation {
                                imageArray[index].isImageVisible.toggle()
                            }
                        }
                    
                }
                
                
//                Image("sacola1")
//                    .renderingMode(.original)
//                    .resizable()
//                    .opacity(isImageVisible ? 1 : 0)
//                    .animation(.linear)
//                    .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.2)
//                    .offset(x: position.width, y: position.height)
//                    .position(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 4.2 / 5)
//                    .onTapGesture {
//                        withAnimation {
//                            isImageVisible.toggle()
//                        }
//                    }
                
//                Button {
//                    print("Edit button was tapped")
//                } label: {
//                    Image("tampa1")
//                        .renderingMode(.original)
//                        .resizable()
//                        .offset(x: position.width, y: position.height)
//                }
//                .frame(width: geo.size.width * 0.07, height: geo.size.height * 0.06)
//                .position(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 3 / 5)
            }
        }
        .ignoresSafeArea()
        
    }
}

struct Game1View_Previews: PreviewProvider {
    static var previews: some View {
        Game1View()
    }
}
