//
//  FirstView.swift
//  Catador
//
//  Created by Jessica Akemi Meguro on 23/04/22.
//

import SwiftUI

struct FirstView: View {
    
    @State var canNavigate: Bool = false
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    struct StartButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
            ZStack {
                Image("buttonStart")
                    .scaleEffect(configuration.isPressed ? 0.8 : 0.8)
                //                    .opacity(configuration.isPressed ? 1 : 08)
                    .animation(.default, value: configuration.isPressed)
                Text("Start")
                    .padding(.bottom)
                    .font(.custom("Inter-Bold", size: 32))
                    .foregroundColor(.black)
                    .opacity(0.9)
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.accentColor.ignoresSafeArea()
        
            
            VStack(alignment: .center){
                Image("fundoTela1")
                    .resizable()
                    .scaledToFit()
                    .padding(80)
            }
            
            VStack {
                Image("jornalTela1")
                    .resizable()
                                .frame(width: 400, height: 500)
                                .position(x: UIScreen.main.bounds.width * 4 / 5, y: UIScreen.main.bounds.height * 1.4 / 5)
                                .rotationEffect(.degrees(-12))
            }
            
            VStack {
                NavigationLink(destination: View2(), isActive: $canNavigate) {
                    Button("") {
                        self.canNavigate = true
                    } .buttonStyle(StartButton())
                }
                .frame(width: 200, height: 220)
                .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 4.5 / 5)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }
    
    struct FirstView_Previews: PreviewProvider {
        static var previews: some View {
            FirstView()
        }
    }
}
