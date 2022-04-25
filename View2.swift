//
//  View2.swift
//  Catador
//
//  Created by Jessica Akemi Meguro on 23/04/22.
//

import SwiftUI

struct View2: View {
    
    @State var canNavigate: Bool = false
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    struct NextButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
            ZStack {
                Image("buttonNext")
                    .scaleEffect(configuration.isPressed ? 0.8 : 0.8)
                    .animation(.default, value: configuration.isPressed)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            
            VStack(alignment: .center){
                Image("fundoView2")
                    .resizable()
                    .scaledToFit()
                    .padding(80)
            }
            
            Text("Meet José, a brazilian waste picker,")
                .font(.custom("Inter-SemiBold", size: 24))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .position(x: UIScreen.main.bounds.width * 1.6 / 5, y: UIScreen.main.bounds.height * 0.5 / 5)
                .shadow(radius: 10)
                .padding(80)
            
            ZStack {
            Image("jornal3")
                .resizable()
                .frame(width: 500, height: 305)
                .rotationEffect(.degrees(-5))
            
            Text("It's a hard and dangerous job,\n with huge environmental impact,\n collecting and recycling all \nthe street trash on his cart.")
                
                .font(.custom("Inter-SemiBold", size: 24))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .opacity(0.8)
            }
            .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 1.5 / 5)
            .shadow(radius: 10)
            
            Text("People often ignore his existence,")
                .padding(80)
                .font(.custom("Inter-SemiBold", size: 24))
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
                .position(x: UIScreen.main.bounds.width * 3 / 5, y: UIScreen.main.bounds.height * 2.15 / 5)
                .shadow(radius: 10)
            
            Text("But he'll teach you how to recycle and change the world.")
                .padding(.bottom)
                .font(.custom("Inter-SemiBold", size: 24))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.main.bounds.width * 2.25 / 5, y: UIScreen.main.bounds.height * 4.75 / 5)
                .shadow(radius: 10)
                .opacity(0.8)
            
            HStack{
                
                NavigationLink(destination: Game1View(), isActive: $canNavigate) {
                    Button("") {
                        self.canNavigate = true
                    } .buttonStyle(NextButton())
                }
                .frame(width: 50, height: 50)
                .position(x: UIScreen.main.bounds.width * 4.68 / 5, y: UIScreen.main.bounds.height * 4.68 / 5)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
