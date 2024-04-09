//
//  NoQuizView.swift
//  investment 101
//
//  Created by Celine Tsai on 11/8/23.
//

import SwiftUI

struct NoQuizView: View {
    @State private var navigateToMainMenu = false
    @ObservedObject private var viewModel = QuizViewModel()
    let nextTopicID: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea() // Set white background
                
                VStack(spacing: 20) {
                    Text("Yay, there's no quiz!")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.vertical, 60)
                    
                    NavigationLink(destination: MainMenuView(), isActive: $navigateToMainMenu) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Button(action: {
                        navigateToMainMenu = true
                        viewModel.updateUnlockedTopicIDs(nextTopicID)
                    }) {
                        Text("Done")
                            .foregroundColor(.white) // Set text color to white
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .frame(width: 200, height: 50)
                            .background(Color.blue) // Set background color to blue
                            .cornerRadius(10) // Add corner radius
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


