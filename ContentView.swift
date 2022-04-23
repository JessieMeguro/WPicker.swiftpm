import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Game1View()
                    Game2View()
                    Game3View()
                    Game4View()
                }
            }
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
