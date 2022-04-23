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
            Image("fundoTela1")
                .resizable()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
