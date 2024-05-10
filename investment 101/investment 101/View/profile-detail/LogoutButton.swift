import SwiftUI

struct LogoutButton: View {
    @EnvironmentObject var appState: AppState
    @State private var showingLogoutAlert = false

    var body: some View {
        VStack {
            Spacer() // This will push everything to the bottom.
            HStack {
                Rectangle() // Top line
                    .frame(height: 2)
                    .foregroundColor(.red)
                    .padding(.horizontal, 8) // Small padding around the horizontal edges
                
                Spacer() // This will take up any available space
            }
            
            Button(action: {
                // Trigger the alert by updating the state
                self.showingLogoutAlert = true
            }) {
                Text("Logout")
                    .fontWeight(.bold) // Makes text bold
                    .foregroundColor(.red) // Use red color for the text
                    .background(Color.white.opacity(0)) // Transparent background
            }
            .frame(minWidth: 0, maxWidth: .infinity) // Makes it expand to the full available width
            
            HStack {
                Rectangle() // Bottom line
                    .frame(height: 2)
                    .foregroundColor(.red)
                    .padding(.horizontal, 8) // Small padding around the horizontal edges
                
                Spacer() // This will take up any available space
            }
            
            .padding(.bottom, 8) // Small bottom margin
        }
        .alert(isPresented: $showingLogoutAlert) {
            Alert(
                title: Text("Are you sure you want to logout?"),
                primaryButton: .destructive(Text("Confirm"), action: {
                    logoutUser()
                }),
                secondaryButton: .cancel()
            )
        }
    }

    func logoutUser() {
        let loginModel = LoginModel()
        loginModel.setLoginFalse()
        
        // Update app state to reflect that user is no longer authenticated
        appState.isAuthenticated = false
    }

}

class AppState: ObservableObject {
    @Published var isAuthenticated = false
}



