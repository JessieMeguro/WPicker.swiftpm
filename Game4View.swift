//
//  Game4View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 22/04/22.
//

import AVFoundation
import Foundation
import SwiftUI

var musicPlayer: AVAudioPlayer!

struct FinishButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        ZStack {
            Image("buttonStart")
                .scaleEffect(configuration.isPressed ? 0.8 : 0.8)
                .frame(width: 700, height: 300)
                .animation(.default, value: configuration.isPressed)
            Text("Finish the day")
                .padding(.bottom)
                .font(.custom("Inter-Bold", size: 24))
                .foregroundColor(.black)
                .opacity(0.9)
        }

    }
}

struct Game4View: View {
    
    @State var imageArray: [(imageName: String, position: CGPoint, isImageVisible: Bool)] = [("cano", CGPoint(x: UIScreen.main.bounds.width * 3.5 / 5, y: UIScreen.main.bounds.height * 4.3 / 5), true), ("coca", CGPoint(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 4.5 / 5), true), ("jarraMetal", CGPoint(x: UIScreen.main.bounds.width * 1.5 / 5, y: UIScreen.main.bounds.height * 3.8 / 5), true )
    ]
    
    @State var allRemoved = false
    @State var isDragging = false
    @State var position = CGSize.zero
    @State var if1Clicked = false
    @State var if2Clicked = false
    @State var if3Clicked = false
    @State private var fadeInOut = false
    @State private var isImageVisible = true
    @State private var isImageVisible1 = true
    @State private var isImageVisible2 = true
    @State private var isImageVisible3 = true
    @State private var fadeIn = false
    @State var canNavigate: Bool = false
    @State var tap = false
    @State var showSecondView = false
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        
        ZStack {
            Image("fundoJogo4")
                .resizable()
                .scaledToFill()
            
            ZStack {
                Image("jornalTela4")
                    .resizable()
                    .frame(width: 520, height: 202)
                
                Text("\nAt night, universities let the metal and \ne-waste on outside bins, José can \npick them up and decide what to sell.")
                    .padding(.bottom)
                    .font(.custom("Inter-SemiBold", size: 24))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 0.7 / 5)
            
            ZStack {
                Image("newsInfo")
                    .resizable()
                    .frame(width: 470, height: 100)
                
                Text("Pick up only the recyclable metal.")
                    .padding(.bottom)
                    .font(.custom("Inter-SemiBold", size: 24))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .position(x: UIScreen.main.bounds.width * 2 / 5, y: UIScreen.main.bounds.height * 1.2 / 5)
            .rotationEffect(.degrees(-1))
            
            
            GeometryReader { geo in
                ZStack {
                    Image("clipes")
                        .resizable()
                        .frame(width: geo.size.width * 0.06, height: geo.size.height * 0.03)
                        .position(x: UIScreen.main.bounds.width * 3.5 / 5, y: UIScreen.main.bounds.height * 4.5 / 5)
                        .onTapGesture {
                            if1Clicked = true
                            playSound()
                        }
                    
                    if if1Clicked {
                        ZStack {
                            
                            Text("Too small to recycle.")
                                .padding(.bottom)
                                .font(.custom("Inter-SemiBold", size: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .zIndex(23)
                                .opacity(isImageVisible1 ? 1 : 0)
                                .animation(.easeInOut.delay(5), value: isImageVisible1)
                                .onAppear() {
                                    isImageVisible1 = false
                                }
                            
                            Image("newsInfo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 300)
                                .zIndex(22)
                                .opacity(isImageVisible1 ? 1 : 0)
                                .animation(.easeInOut.delay(5), value: isImageVisible1)
                                .onAppear() {
                                    isImageVisible1 = false
                                }
                        }
                        .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 4.75 / 5)
                        .rotationEffect(.degrees(-4))
                    }
                    
                    Image("extintor")
                        .resizable()
                        .frame(width: geo.size.width * 0.15, height: geo.size.height * 0.2)
                        .position(x: UIScreen.main.bounds.width * 0.8 / 5, y: UIScreen.main.bounds.height * 4.3 / 5)
                        .onTapGesture {
                            if2Clicked = true
                            playSound()
                        }
                    if if2Clicked {
                        ZStack {
                            
                            Text("Extinguishers are\nhazardous waste.")
                                .padding(.bottom)
                                .font(.custom("Inter-SemiBold", size: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .zIndex(24)
                                .opacity(isImageVisible2 ? 1 : 0)
                                .animation(.easeInOut.delay(5), value: isImageVisible2)
                                .onAppear() {
                                    isImageVisible2 = false
                                }
                            
                            Image("newsInfo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 300)
                                .zIndex(23)
                                .opacity(isImageVisible2 ? 1 : 0)
                                .animation(.easeInOut.delay(5), value: isImageVisible2)
                                .onAppear() {
                                    isImageVisible2 = false
                                }
                        }
                        .position(x: UIScreen.main.bounds.width * 0.8 / 5, y: UIScreen.main.bounds.height * 4.6 / 5)
                    }
                    
                    Image("pilha")
                        .resizable()
                        .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.04)
                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 3.9 / 5)
                        .onTapGesture {
                            if3Clicked = true
                            playSound()
                        }
                    if if3Clicked {
                        ZStack {
                            
                            Text("Toxic metals, be careful.")
                                .padding(.bottom)
                                .font(.custom("Inter-SemiBold", size: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .zIndex(24)
                                .opacity(isImageVisible3 ? 1 : 0)
                                .animation(.easeInOut.delay(5), value: isImageVisible3)
                                .onAppear() {
                                    isImageVisible3 = false
                                }
                            
                            Image("newsInfo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 300)
                                .zIndex(23)
                                .opacity(isImageVisible3 ? 1 : 0)
                                .animation(.easeInOut.delay(5), value: isImageVisible3)
                                .onAppear() {
                                    isImageVisible3 = false
                                }
                        }
                        .position(x: UIScreen.main.bounds.width * 2.35 / 5, y: UIScreen.main.bounds.height * 4.06 / 5)
                        .rotationEffect(.degrees(-8))
                    }
                }
            }
            
            
            
            GeometryReader { geo in
                
                ForEach(Array(imageArray.enumerated()), id: \.0) { index, image in
                    Image(image.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .opacity(image.isImageVisible ? 1 : 0)
                        .animation(.linear)
                        .frame(width: geo.size.width * 0.123, height: geo.size.height * 0.07)
                        .offset(x: position.width, y: position.height)
                        .position(image.position)
                        .onTapGesture {
                            playSound2()
                            withAnimation {
                                imageArray[index].isImageVisible.toggle()
                                allRemoved = imageArray.allSatisfy({!$0.isImageVisible})
                            }
                        }
                }
                
                if allRemoved && if1Clicked && if2Clicked && if3Clicked {
                ZStack {
                    Text("")
                }
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 1.3, repeats: false) { (_) in
                        withAnimation {
                            self.showSecondView = true
                        }
                    }
                }
                }
                                if showSecondView == true {
                                    ZStack {
                                        VStack {
                                            Image("fundoCompleto4")
                                                .resizable()
                                                .scaledToFill()
                                                .zIndex(20)
                                                .onAppear() {
                                                    withAnimation(Animation.easeIn(duration: 0.5)) {
                                                        fadeIn.toggle()
                                                    }
                                                }.opacity(fadeIn ? 1 : 0)
                                        }
                
                                        NavigationLink(destination: View3(), isActive: $canNavigate) {
                                            Button("") {
                                                self.canNavigate = true
                                            } .buttonStyle(FinishButton())
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
    
    func playSound() {
        let url = Bundle.main.url(forResource: "metalSound", withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url!)
            musicPlayer?.play()
            musicPlayer.volume = 0.3
        } catch {
            print("error")
        }
    }
    
    func playSound2() {
        let url = Bundle.main.url(forResource: "metalSound2", withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url!)
            musicPlayer?.play()
            musicPlayer.volume = 0.3
        } catch {
            print("error")
        }
    }
    
    struct Game4View_Previews: PreviewProvider {
        static var previews: some View {
            Game4View()
        }
    }
}

