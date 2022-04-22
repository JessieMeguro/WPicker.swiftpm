import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.brown.ignoresSafeArea()
            
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        Game1View()
                        Game2View()
                        Game3View()
                    }
                }
            }
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
}
