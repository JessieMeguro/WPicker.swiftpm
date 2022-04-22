//
//  Game1View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 22/04/22.
//

import Foundation
import SwiftUI

struct Game1View: View {
    
    @State var isDragging = false
    @State private var isImageVisible = true
    @State var position = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Image("fundoJogo1")
                .resizable()
                .scaledToFill()

                        GeometryReader { geo in
                            
                            Image("sacola1")
                                .renderingMode(.original)
                                .resizable()
                                .opacity(isImageVisible ? 1 : 0)
                                .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.2)
                                .offset(x: position.width, y: position.height)
                                .position(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 4.2 / 5)
                                .onTapGesture {
                                    isImageVisible.toggle()
                                }
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
