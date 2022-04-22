//
//  Game3View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 19/04/22.
//

import Foundation
import SwiftUI

enum PositionX {
    case center, left, right
}

enum PositionY {
    case up, down, center
}

struct Game3View: View {
    
    let images = ["caixaFechada", "abertaLados", "aberta1", "aberta2" , "aberta3", "aberta4"]
    
    @State var selectedImage = 0
    
    func checkYPosition (clickPosition: CGPoint, imageSize: CGSize) -> PositionY {
        
        let y = clickPosition.y
        
        let centerHeight = imageSize.height / 2
        
        let range = CGFloat(110)
        
        if y > centerHeight + range {
            return .down
        } else if y < centerHeight - range {
            return .up
        } else {
            return .center
        }
    }
    
    func checkXPosition (clickPosition: CGPoint, imageSize: CGSize) -> PositionX {
        
        let x = clickPosition.x
        
        let centerWidth = imageSize.width / 2
        
        let range = CGFloat(110)
        
        if x > centerWidth + range {
            return .right
        } else if x < centerWidth - range {
            return .left
        } else {
            return .center
        }
    }
    
    func nextImage() {
        if selectedImage < images.count - 1 {
            selectedImage += 1
        }
    }
    
    var body: some View {
        
        
        HStack (alignment: .center){
            ZStack{
                
                Image ("fundo32")
                    .resizable()
                    .scaledToFill()
               
                GeometryReader { geometry in
                    Image(images[selectedImage])
                        .resizable()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 2.5 / 5)

                        .gesture(DragGesture(minimumDistance: 0).onEnded({ click in

                            let clickPositionX = checkXPosition(clickPosition: click.location, imageSize: geometry.size)

                            let clickPositionY = checkYPosition(clickPosition: click.location, imageSize: geometry.size)

                            if selectedImage == 1 {
                                if clickPositionY == .down && clickPositionX == .center {
                                    nextImage()
                                }
                            } else if selectedImage == 2 {
                                if clickPositionY == .center && clickPositionX == .right {
                                    nextImage()
                                }
                            } else if selectedImage == 3{
                                if clickPositionY == .up && clickPositionX == .center {
                                    nextImage()
                                }
                            } else if selectedImage == 4 {
                                if clickPositionY == .center && clickPositionX == .center {
                                    nextImage()
                                }
                            }
                            else {
                                nextImage()
                            }

                        }))
                }

                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Game3View_Previews: PreviewProvider {
    static var previews: some View {
        Game3View()
            .preferredColorScheme(.dark)
    }
}
