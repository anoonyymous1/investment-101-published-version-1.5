import SwiftUI

struct StartView: View {
    @State private var showSplash = true   // Initially show the splash screen
    @State private var isLoggedIn: Bool = false
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        ZStack {
            if checkIfUserIsLoggedIn() {
                LoginSuccessView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            self.isLoggedIn = checkIfUserIsLoggedIn()  // Check login status
        }
        .navigationBarBackButtonHidden(true)  // Hide the back button to prevent navigation
        .navigationBarHidden(true)            // Optionally hide the entire navigation bar
    }
    
    
}

