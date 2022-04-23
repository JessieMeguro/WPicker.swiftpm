//
//  FirstView.swift
//  Catador
//
//  Created by Jessica Akemi Meguro on 23/04/22.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            VStack(alignment: .center){
                Image("fundoTela1")
                    .resizable()
//                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                                .padding(3)
            }
//            .frame(width: 600, height: 750, alignment: .center)
//            .padding(200)
            
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
