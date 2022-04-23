//
//  Game1View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 22/04/22.
//

import AVFoundation
import Foundation
import SwiftUI

var player: AVAudioPlayer!

struct Game1View: View {
    
    @State var imageArray: [(imageName: String, position: CGPoint, isImageVisible: Bool)] = [("sacola1", CGPoint(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 3.5 / 5), true), ("tampa1", CGPoint(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 4.2 / 5), true), ("tampa2", CGPoint(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 2.5 / 5), true ), ("bottle1", CGPoint(x: UIScreen.main.bounds.width * 4.5 / 5, y: UIScreen.main.bounds.height * 2.5 / 5), true), ("bottle2", CGPoint(x: UIScreen.main.bounds.width * 1.5 / 5, y: UIScreen.main.bounds.height * 3.1 / 5), true), ("food1", CGPoint(x: UIScreen.main.bounds.width * 2.9 / 5, y: UIScreen.main.bounds.height * 2.9 / 5), true)
    ]
    
    @State var allRemoved = false
    @State var isDragging = false
    @State var position = CGSize.zero
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        
        ZStack {
            Image("fundoJogo1")
                .resizable()
                .scaledToFill()
            
            VStack {
                Image("jornalTela2")
                    .resizable()
                                .frame(width: 568, height: 161)
                                .position(x: UIScreen.main.bounds.width * 2.1 / 5, y: UIScreen.main.bounds.height * 0.5 / 5)
                                .rotationEffect(.degrees(-12))
            }
            
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
                                playSound()
                                allRemoved = imageArray.allSatisfy({!$0.isImageVisible})
                            }
                        }
                }
                if allRemoved {
                    VStack {
//                        Image("jornalTela1")
                        NavigationLink(destination: Game2View()) {
                            Text("Botão")
                                .background(.green)
                                .zIndex(10)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

func playSound() {
    let url = Bundle.main.url(forResource: "plasticSound", withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print("error")
    }
}

struct Game1View_Previews: PreviewProvider {
    static var previews: some View {
        Game1View()
    }
}
