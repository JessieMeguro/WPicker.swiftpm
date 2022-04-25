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
                .padding(.bottom)
                .font(.custom("Inter-SemiBold", size: 28))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .position(x: UIScreen.main.bounds.width * 1.9 / 5, y: UIScreen.main.bounds.height * 0.8 / 5)
                .shadow(radius: 10)
            
            ZStack {
            Image("jornal3")
                .resizable()
                .frame(width: 500, height: 305)
                .rotationEffect(.degrees(-5))
            
            Text("It's a hard and dangerous job,\n with huge environmental impact,\n collecting and recycling all \nthe street trash on his cart.")
                .padding(.bottom)
                .font(.custom("Inter-SemiBold", size: 28))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            }
            .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 1.4 / 5)
            .shadow(radius: 10)
            
            Text("People ignore his existence and knowledge,")
                .padding(.bottom)
                .font(.custom("Inter-SemiBold", size: 28))
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
                .position(x: UIScreen.main.bounds.width * 2.9 / 5, y: UIScreen.main.bounds.height * 2.1 / 5)
                .shadow(radius: 10)
            
            Text("But with him, you'll learn how to recycle and change the world.")
                .padding(.bottom)
                .font(.custom("Inter-SemiBold", size: 24))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.main.bounds.width * 2.3 / 5, y: UIScreen.main.bounds.height * 4.72 / 5)
                .shadow(radius: 10)
            
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
