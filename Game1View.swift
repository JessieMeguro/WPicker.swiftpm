//
//  Game1View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 22/04/22.
//

import Foundation
import SwiftUI

struct Game1View: View {
    
    let imageArray: [(imageName: String, position: CGPoint)] = [("sacola1", CGPoint(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 4.2 / 5)) , ("tampa1", CGPoint(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 3 / 5)), ("tampa2", CGPoint(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 3 / 5))]
    
    @State var isDragging = false
    @State private var isImageVisible = true
    @State var position = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Image("fundoJogo1")
                .resizable()
                .scaledToFill()
            
            GeometryReader { geo in
                
                ForEach(imageArray, id: \.self.imageName) { image in
                    Image(image.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .opacity(isImageVisible ? 1 : 0)
                        .animation(.linear)
                        .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.07)
                        .offset(x: position.width, y: position.height)
                        .position(image.position)
                        .onTapGesture {
                            withAnimation {
                                isImageVisible.toggle()
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
