//
//  LoginSuccessView.swift
//  investment 101
//
//  Created by Celine Tsai on 9/4/24.
//
import SwiftUI

struct LoginSuccessView: View {
    
    @State var showSplash: Bool = false
    
    var body: some View {
        ZStack {
            if getLoginState() {
                MainMenuView()
            } else {
                SplashScreenView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showSplash = true
                    setLoginState(true)
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the back button
        .navigationBarHidden(true) // Optionally hide the entire navigation bar
    }
}
