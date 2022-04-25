//
//  Game3View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 19/04/22.
//

import AVFoundation
import Foundation
import SwiftUI

var soundPlayer: AVAudioPlayer!

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
    
    @State var animate = false
    @State var needsClick = true
    @State var canNavigate: Bool = false
    @State var showSecondView = false
    
    struct Clicked2: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
            ZStack {
                Image("buttonStart")
                    .scaleEffect(configuration.isPressed ? 0.8 : 0.8)
                    .frame(width: 700, height: 300)
                    .animation(.default, value: configuration.isPressed)
                Text("Continue the day")
                    .padding(.bottom)
                    .font(.custom("Inter-Bold", size: 24))
                    .foregroundColor(.black)
                    .opacity(0.9)
            }
        }
    }
    
    struct Loading: View {
        
        @State var animate = false
        @State var needsClick = true
        
        var body: some View {
            ZStack{
                Circle().fill(Color.red.opacity(0.25)).frame(width: 150, height: 150)
                    .scaleEffect(self.animate ? 1 : 0)
                Circle().fill(Color.red.opacity(0.35)).frame(width: 100, height: 100)
                    .scaleEffect(self.animate ? 1 : 0)
                Circle().fill(Color.red)
                    .frame(width: 50, height: 50)
                    .scaleEffect(self.animate ? 1 : 0)
            }
            .onAppear {
                self.animate.toggle()
                needsClick = false
            }
            .opacity(needsClick ? 1 : 0)
            .animation(Animation.linear(duration: 1).repeatCount(5, autoreverses: false))
        }
    }
    
    func nextImage() {
        if selectedImage < images.count - 1 {
            selectedImage += 1
        }
    }

    
    @State private var isImageVisible = true
    @State private var fadeIn = false
    
    var body: some View {
        
        
        HStack (alignment: .center){
            ZStack{
                
                Image ("fundo32")
                    .resizable()
                    .scaledToFill()
                
                ZStack {
                    Image("jornalTela3")
                        .resizable()
                        .frame(width: 345, height: 398)
                    
                    Text("José finds a lot of boxes\n during the day, but they \nneed to be flatenned \nbefore recycling.\n")
                        .padding(.bottom)
                        .font(.custom("Inter-SemiBold", size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .rotationEffect(.degrees(-5))
                }
                .position(x: UIScreen.main.bounds.width * 3.95 / 5, y: UIScreen.main.bounds.height * 4 / 5)
                
                ZStack {
                    Image("jornalAction2")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .opacity(isImageVisible ? 0 : 1)
                        .animation(.spring().delay(0.1), value: isImageVisible)
                    
                    Text("Let's open the \ncardboard box.")
                        .padding(.bottom)
                        .font(.custom("Inter-SemiBold", size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .opacity(isImageVisible ? 0 : 1)
                        .animation(.spring().delay(0.1), value: isImageVisible)
                }
                .onAppear {
                    isImageVisible = false
                }
                .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 4.65 / 5)
                .rotationEffect(.degrees(-5))
                
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
                                    playSound()
                                }
                            } else if selectedImage == 2 {
                                if clickPositionY == .center && clickPositionX == .right {
                                    nextImage()
                                    playSound2()
                                }
                            } else if selectedImage == 3{
                                if clickPositionY == .up && clickPositionX == .center {
                                    nextImage()
                                    playSound3()
                                }
                            } else if selectedImage == 4 {
                                if clickPositionY == .center && clickPositionX == .center {
                                    nextImage()
                                    playSound4()
                                }
                            }
                            else {
                                nextImage()
                            }
                            
                        }))
                }
                
                if selectedImage == 0 {
                    Loading()
                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 2.6 / 5)
                }
                
                if selectedImage == 1 {
                    Loading()
                        .position(x: UIScreen.main.bounds.width * 2.8 / 5, y: UIScreen.main.bounds.height * 3.2 / 5)
                }
                
                if selectedImage == 2 {
                    Loading()
                        .position(x: UIScreen.main.bounds.width * 3.7 / 5, y: UIScreen.main.bounds.height * 2.3 / 5)
                }
                
                if selectedImage == 3 {
                    Loading()
                        .position(x: UIScreen.main.bounds.width * 2.8 / 5, y: UIScreen.main.bounds.height * 1.3 / 5)
                }
                
                if selectedImage == 4 {
                    ZStack {
                        Text("")
                    }
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                            withAnimation {
                                self.showSecondView = true
                            }
                        }
                    }
                    Loading()
                        .position(x: UIScreen.main.bounds.width * 2.2 / 5, y: UIScreen.main.bounds.height * 2.5 / 5)
                }
                
                if showSecondView == true {
                    ZStack{
                        VStack {
                            Image("fundoCompleto3")
                                .resizable()
                                .scaledToFill()
                                .zIndex(20)
                                .onAppear() {
                                    withAnimation(Animation.easeIn( duration: 0.5)) {
                                        fadeIn.toggle()
                                    }
                                }.opacity(fadeIn ? 1 : 0)
                        }
                        
                        NavigationLink(destination: Game4View(), isActive: $canNavigate) {
                            Button("") {
                                self.canNavigate = true
                            } .buttonStyle(ContinueButton())
                        }
                        .frame(width: 200, height: 220)
                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 4.5 / 5)
                        .zIndex(21)
                    }
                }
                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

func playSound() {
    let url = Bundle.main.url(forResource: "rasgoSound4", withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        soundPlayer = try AVAudioPlayer(contentsOf: url!)
        soundPlayer?.play()
        soundPlayer.volume = 0.3
    } catch {
        print("error")
    }
}

func playSound2() {
    let url = Bundle.main.url(forResource: "rasgoSound2", withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        soundPlayer = try AVAudioPlayer(contentsOf: url!)
        soundPlayer?.play()
        soundPlayer.volume = 0.3
    } catch {
        print("error")
    }
}

func playSound3() {
    let url = Bundle.main.url(forResource: "rasgoSound3", withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        soundPlayer = try AVAudioPlayer(contentsOf: url!)
        soundPlayer?.play()
        soundPlayer.volume = 0.3
    } catch {
        print("error")
    }
}

func playSound4() {
    let url = Bundle.main.url(forResource: "rasgoSound", withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        soundPlayer = try AVAudioPlayer(contentsOf: url!)
        soundPlayer?.play()
        soundPlayer.volume = 0.3
    } catch {
        print("error")
    }
}

struct Game3View_Previews: PreviewProvider {
    static var previews: some View {
        Game3View()
            .preferredColorScheme(.dark)
    }
}
