//
//  View2.swift
//  Catador
//
//  Created by Jessica Akemi Meguro on 23/04/22.
//

import SwiftUI

struct View3: View {
    
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
                Image("fundo3")
                    .resizable()
                    .scaledToFit()
                    .padding(80)
            }
            
            Text("Before going home, José can sell \nor create new objects with his materials.")
                .padding(.bottom)
                .font(.custom("Inter-SemiBold", size: 28))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .position(x: UIScreen.main.bounds.width * 2.5 / 5, y: UIScreen.main.bounds.height * 0.75 / 5)
                .shadow(radius: 10)
            
            VStack{
                NavigationLink(destination: FinalView1(), isActive: $canNavigate) {
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

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
