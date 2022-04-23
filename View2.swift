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
                Image("fundoTela1")
                    .resizable()
                    .scaledToFit()
                    .padding(80)
            }
            
            VStack{
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
