import SwiftUI

struct LoginSuccessView: View {
    
    @State private var showSplash = true
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
            } else {
                MainMenuView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                loginUser()
                appState.isAuthenticated = true
                withAnimation {
                    // After login, change state to show main menu
                    self.showSplash = false
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the back button
        .navigationBarHidden(true) // Optionally hide the entire navigation bar
    }
    
}

