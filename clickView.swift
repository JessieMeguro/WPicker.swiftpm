//
//  clickView.swift
//  Catador
//
//  Created by Jessica Akemi Meguro on 24/04/22.
//

import SwiftUI

struct clickView: View {
    var body: some View {
        Loading()
    }
}

struct clickView_Previews: PreviewProvider {
    static var previews: some View {
        clickView()
    }
}

struct Loading: View {
    
    @State var animate = false
    @State var needsClick = true
    
    var body: some View {
        ZStack{
            Circle().fill(Color.red.opacity(0.25)).frame(width: 100, height: 100)
                .scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.red.opacity(0.35)).frame(width: 70, height: 70)
                .scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.red)
                .frame(width: 35, height: 35)
                .scaleEffect(self.animate ? 1 : 0)
        }
        .onAppear {
            self.animate.toggle()
            needsClick = false
        }
        .opacity(needsClick ? 1 : 0)
        .animation(Animation.linear(duration: 1).repeatCount(5, autoreverses: false))
    }
}
