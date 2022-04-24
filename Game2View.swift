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
    @State var if1Clicked = false
    @State var if2Clicked = false
    @State var if3Clicked = false
    @State var if4Clicked = false
    @State private var fadeInOut = false
    @State private var isImageVisible = true
    @State private var isImageVisible2 = true
    @State private var isImageVisible3 = true
    @State private var isImageVisible4 = true
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
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
                    .font(.custom("Inter-Bold", size: 27))
                    .foregroundColor(.black)
                    .opacity(0.9)
            }
            
        }
    }
    
    var body: some View {
        ZStack {
            
            //            Button ("Show") {
            //                showingPopover = true
            //            }
            //            .background(.blue)
            //            .zIndex(2)
            
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
                    
                    
                    Image("copo1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.19, height: geo.size.height * 0.15)
                        .position(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 1.9 / 5.1)
                        
                    Image("espelho1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.22)
                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 0.9 / 5)
                      
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
                    
                    
                    Image("vinagre1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.10)
                        .position(x: UIScreen.main.bounds.width * 2.4 / 5, y: UIScreen.main.bounds.height * 2 / 5)
                    
                    
                    Image("vinho1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.3)
                        .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 1 / 5)
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
                            .onTapGesture {
                                if1Clicked = true
                            }
                        if if1Clicked {
                            ZStack {
                                Text("José starts his days picking up \nthe street trash, specially the plastic \nthrown around during the nights.")
                                    .padding(.bottom)
                                    .font(.custom("Inter-SemiBold", size: 27))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .zIndex(21)
                                    .opacity(isImageVisible ? 1 : 0)
                                    .animation(.easeInOut.delay(8), value: isImageVisible)
                                    .onAppear() {
                                        isImageVisible = false
                                        }
                                
                                Image("jornal2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .zIndex(20)
                                    .opacity(isImageVisible ? 1 : 0)
                                    .animation(.easeInOut.delay(8), value: isImageVisible)
                                    .onAppear() {
                                        isImageVisible = false
                                        }
                                    }
                            .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 1 / 5)
                            }
                        
                        Image("jarra1")
                            .resizable()
                            .frame(width: geo.size.width * 0.24, height: geo.size.height * 0.18)
                            .position(x: UIScreen.main.bounds.width * 1 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 1.8 / 5)
                            .onTapGesture {
                                if4Clicked = true
                            }
                        if if4Clicked {
                            ZStack {
                                Text("José starts his days picking up \nthe street trash, specially the plastic \nthrown around during the nights.")
                                    .padding(.bottom)
                                    .font(.custom("Inter-SemiBold", size: 27))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .zIndex(21)
                                    .opacity(isImageVisible2 ? 1 : 0)
                                    .animation(.easeInOut.delay(8), value: isImageVisible2)
                                    .onAppear() {
                                        isImageVisible2 = false
                                        }
                                
                                Image("jornal2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .zIndex(20)
                                    .opacity(isImageVisible2 ? 1 : 0)
                                    .animation(.easeInOut.delay(8), value: isImageVisible2)
                                    .onAppear() {
                                        isImageVisible2 = false
                                        }
                                    }
                            .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 1 / 5)
                            }
                        
                        Image("perfume2")
                            .resizable()
                            .frame(width: geo.size.width * 0.24, height: geo.size.height * 0.18)
                            .position(x: UIScreen.main.bounds.width * 0.9 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 0.75 / 5)
                            .onTapGesture {
                                if2Clicked = true
                            }
                        if if2Clicked {
                            ZStack {
                                Text("Night")
                                    .padding(.bottom)
                                    .font(.custom("Inter-SemiBold", size: 27))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .zIndex(21)
                                    .opacity(isImageVisible3 ? 1 : 0)
                                    .animation(.easeInOut.delay(8), value: isImageVisible3)
                                    .onAppear() {
                                        isImageVisible3 = false
                                        }
                                
                                Image("jornal2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .zIndex(20)
                                    .opacity(isImageVisible3 ? 1 : 0)
                                    .animation(.easeInOut.delay(8), value: isImageVisible3)
                                    .onAppear() {
                                        isImageVisible3 = false
                                        }
                                    }
                            .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 1 / 5)
                            }
                        
                        Image("vinagre1")
                            .resizable()
                            .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.10)
                            .position(x: UIScreen.main.bounds.width * 2.4 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 2 / 5)
                        
                        Image("vinho2")
                            .resizable()
                            .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.3)
                            .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: BackgroundSize.height / 2 + UIScreen.main.bounds.height * 1 / 5)
                            .onTapGesture {
                                if3Clicked = true
                            }
                    }
                }
            if if3Clicked {
                ZStack {
                    Text("José")
                        .padding(.bottom)
                        .font(.custom("Inter-SemiBold", size: 27))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .zIndex(21)
                        .opacity(isImageVisible4 ? 1 : 0)
                        .animation(.easeInOut.delay(8), value: isImageVisible4)
                        .onAppear() {
                            isImageVisible4 = false
                            }

                    Image("jornal2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .zIndex(20)
                        .opacity(isImageVisible4 ? 1 : 0)
                        .animation(.easeInOut.delay(8), value: isImageVisible4)
                        .onAppear() {
                            isImageVisible4 = false
                            }
                        }
                .position(x: UIScreen.main.bounds.width * 3.8 / 5, y: UIScreen.main.bounds.height * 1 / 5)
                }
                
                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct Game2View_Previews: PreviewProvider {
        static var previews: some View {
            Game2View()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
