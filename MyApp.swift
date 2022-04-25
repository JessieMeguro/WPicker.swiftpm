import SwiftUI

@main
struct MyApp: App {
    
    init() {
            try! UIFont.registerFonts(withExtension: "ttf") // Para fontes com formato ttf
        }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
            FirstView()
                    
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(.stack)
        }
        
    }
}
