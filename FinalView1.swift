//
//  View2.swift
//  Catador
//
//  Created by Jessica Akemi Meguro on 23/04/22.
//

import SwiftUI

struct FinalView1: View {
    
    @State var canNavigate: Bool = false
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    struct RestartButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
            ZStack {
                Image("buttonStart")
                    .scaleEffect(configuration.isPressed ? 0.8 : 0.8)
                //                    .opacity(configuration.isPressed ? 1 : 08)
                    .animation(.default, value: configuration.isPressed)
                Text("Play again")
                    .padding(.bottom)
                    .font(.custom("Inter-Bold", size: 40))
                    .foregroundColor(.black)
                    .opacity(0.9)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            
            VStack(alignment: .center){
                Image("fundoViewFinal")
                    .resizable()
                    .scaledToFit()
                    .padding(80)
            }
            
            ZStack {
            Image("jornal3")
                .resizable()
                .frame(width: 750, height: 425)
                .rotationEffect(.degrees(-5))
            
            Text("Let's treasure and be more like the waste pickers\n and all recycling workers.\n \nRecycle with care and sort your trash out,\n and we'll have a greener and better world.")
                .padding(.bottom)
                .font(.custom("Inter-SemiBold", size: 28))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .opacity(0.8)
            }
            .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 1.4 / 5)
            .shadow(radius: 10)
            
            VStack{
                NavigationLink(destination: FirstView(), isActive: $canNavigate) {
                    Button("") {
                        self.canNavigate = true
                    } .buttonStyle(RestartButton())
                }
                .frame(width: 200, height: 220)
                .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 4.5 / 5)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }
}

struct FinalView1_Previews: PreviewProvider {
    static var previews: some View {
        FinalView1()
    }
}
