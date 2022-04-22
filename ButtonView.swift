//
//  ButtonView.swift
//  Picker
//
//  Created by Jessica Akemi Meguro on 20/04/22.
//
import Foundation
import SwiftUI

struct ButtonView: View {
    
    @State var canNavigate: Bool = false
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Quantum physics")
                    .font(.system(size: 75, weight: .bold)) .foregroundColor(.white)
                NavigationLink(destination: Game3View()) {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 200, height: 200)
                        Text("tap to start")
                            .padding(.bottom)
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.red)
                    }
                    
                }
                .padding(.top, 100)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
