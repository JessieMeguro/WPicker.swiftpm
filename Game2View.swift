//
//  Game2View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 20/04/22.
//

import Foundation
import SwiftUI

struct Game2View: View {
    
    @State var BackgroundSize = CGSize.zero
    
    var body: some View {
        ZStack {
            Image("fundoJogo2")
                .resizable()
                .scaledToFill()
                .background(
                    GeometryReader{ geometry in
                        Color.clear
                            .onAppear {
                                BackgroundSize = geometry.size
                            }
                    }
                )
            
            Image("jornalJogo2")
                .resizable()
                .frame(width: 500, height: 320)
            
            Group {
                GeometryReader { geo in
                    Image("bolaDeGude")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.07, height: geo.size.height * 0.05)
                        .position(x: UIScreen.main.bounds.width * 4.5 / 5, y: UIScreen.main.bounds.height * 1.1 / 5)
                        .onTapGesture {
                            print("dalhe")
                        }
                    
                    
                    Image("copo1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.19, height: geo.size.height * 0.15)
                        .position(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 1.9 / 5.1)
                        .onTapGesture {
                            print("dalhe")
                        }
                    
                    Image("espelho1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.22)
                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 0.9 / 5)
                        .onTapGesture {
                            print("dalhe")
                        }
                    
                    Image("jarra2")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.24, height: geo.size.height * 0.18)
                        .position(x: UIScreen.main.bounds.width * 1 / 5, y: UIScreen.main.bounds.height * 1.8 / 5)
                        .onTapGesture {
                            print("dalhe")
                        }
                    
                    Image("perfume1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.24, height: geo.size.height * 0.18)
                        .position(x: UIScreen.main.bounds.width * 0.9 / 5, y: UIScreen.main.bounds.height * 0.75 / 5)
                        .onTapGesture {
                            print("dalhe")
                        }
                    
                    Image("vinagre1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.10)
                        .position(x: UIScreen.main.bounds.width * 2.4 / 5, y: UIScreen.main.bounds.height * 2 / 5)
                        .onTapGesture {
                            print("dalhe")
                        }
                    
                    
                    Image("vinho1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.3)
                        .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 1 / 5)
                        .onTapGesture {
                            print("dalhe")
                        }
                }
                
            }
            
            Group {
                
                GeometryReader { geo in
                    Image("bolaDeGude")
                        .resizable()
                        .frame(width: geo.size.width * 0.07, height: geo.size.height * 0.05)
                        .position(x: UIScreen.main.bounds.width * 4.5 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 1.1 / 5)
                    
                    Image("copo1")
                        .resizable()
                        .frame(width: geo.size.width * 0.19, height: geo.size.height * 0.15)
                        .position(x: UIScreen.main.bounds.width * 4.3 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 1.9 / 5.1)
                    
                    Image("espelho2")
                        .resizable()
                        .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.22)
                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 0.9 / 5)
                    
                    Image("jarra1")
                        .resizable()
                        .frame(width: geo.size.width * 0.24, height: geo.size.height * 0.18)
                        .position(x: UIScreen.main.bounds.width * 1 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 1.8 / 5)
                    
                    Image("perfume2")
                        .resizable()
                        .frame(width: geo.size.width * 0.24, height: geo.size.height * 0.18)
                        .position(x: UIScreen.main.bounds.width * 0.9 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 0.75 / 5)
                    
                    Image("vinagre1")
                        .resizable()
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.10)
                        .position(x: UIScreen.main.bounds.width * 2.4 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 2 / 5)
                    
                    Image("vinho2")
                        .resizable()
                        .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.3)
                        .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 1 / 5)
                }
            }
            
            
            
        }
        .ignoresSafeArea()
        //            .navigationBarHidden(true)
        //            .navigationBarBackButtonHidden(true)
    }
}

struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
