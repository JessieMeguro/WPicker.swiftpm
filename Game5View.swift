//
//  Game5View.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 22/04/22.
//

import AVFoundation
import Foundation
import SwiftUI

//struct ContinueButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//        ZStack {
//            Image("buttonStart")
//                .scaleEffect(configuration.isPressed ? 0.8 : 0.8)
//                .frame(width: 700, height: 300)
//                .animation(.default, value: configuration.isPressed)
//            Text("Continue the day")
//                .padding(.bottom)
//                .font(.custom("Inter-Bold", size: 24))
//                .foregroundColor(.black)
//                .opacity(0.9)
//        }
//
//    }
//}

struct Game5View: View {
    
    @State var imageArray: [(imageName: String, position: CGPoint, isImageVisible: Bool)] = [("sacola1", CGPoint(x: UIScreen.main.bounds.width * 4.3 / 5, y: UIScreen.main.bounds.height * 3.5 / 5), true), ("tampa1", CGPoint(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 4.2 / 5), true), ("tampa2", CGPoint(x: UIScreen.main.bounds.width * 3.2 / 5, y: UIScreen.main.bounds.height * 2.5 / 5), true ), ("bottle1", CGPoint(x: UIScreen.main.bounds.width * 4.5 / 5, y: UIScreen.main.bounds.height * 2.5 / 5), true), ("bottle2", CGPoint(x: UIScreen.main.bounds.width * 1.5 / 5, y: UIScreen.main.bounds.height * 3.1 / 5), true), ("food1", CGPoint(x: UIScreen.main.bounds.width * 2.9 / 5, y: UIScreen.main.bounds.height * 2.9 / 5), true)
    ]
    
    @State var allRemoved = false
    @State var isDragging = false
    @State var position = CGSize.zero
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    @State var canNavigate: Bool = false
    @State private var isImageVisible = true
    @State private var fadeIn = false
    
    var body: some View {
        
        ZStack {
            Image("fundoJogo1")
                .resizable()
                .scaledToFill()
            
            ZStack {
                Image("jornal2")
                    .resizable()
                    .frame(width: 520, height: 202)
                
                Text("José starts his days picking up \nthe street trash, specially the plastic \nthrown around during the nights.")
                    .padding(.bottom)
                    .font(.custom("Inter-SemiBold", size: 27))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            .position(x: UIScreen.main.bounds.width * 1.9 / 5, y: UIScreen.main.bounds.height * 0.55 / 5)
            .rotationEffect(.degrees(-11))
            
            ZStack {
                Image("jornal4")
                    .resizable()
                    .frame(width: 500, height: 125)
                    .opacity(isImageVisible ? 0 : 1)
                    .animation(.spring().delay(4), value: isImageVisible)
                
                Text("Help him pick up the plastic trash.")
                    .padding(.bottom)
                    .font(.custom("Inter-SemiBold", size: 24))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .opacity(isImageVisible ? 0 : 1)
                    .animation(.spring().delay(4), value: isImageVisible)
            }
            .onAppear {
                isImageVisible = false
            }
            .position(x: UIScreen.main.bounds.width * 2 / 5, y: UIScreen.main.bounds.height * 0.9 / 5)
            .rotationEffect(.degrees(-11))
            
            //            ZStack {
            //                Image("jornal2")
            //                    .resizable()
            //                    .frame(width: 520, height: 202)
            //            }
            
            
            
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
                                allRemoved = imageArray.allSatisfy({!$0.isImageVisible})
                            }
                        }
                }
//                if allRemoved {
//                    ZStack {
//
//                        VStack {
//                            Image("completedGame1")
//                                .resizable()
//                                .scaledToFill()
//                                .zIndex(20)
//                                .onAppear() {
//                                    withAnimation(Animation.easeIn(duration: 0.5)) {
//                                        fadeIn.toggle()
//                                    }
//                                }.opacity(fadeIn ? 1 : 0)
//                        }
//
//                        NavigationLink(destination: Game2View(), isActive: $canNavigate) {
//                            Button("") {
//                                self.canNavigate = true
//                            } .buttonStyle(ContinueButton())
//                        }
//                        .frame(width: 200, height: 220)
//                        .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 4.5 / 5)
//                        .zIndex(21)
//
//                    }
//                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    struct Game5View_Previews: PreviewProvider {
        static var previews: some View {
            Game5View()
        }
    }
}
