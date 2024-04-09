//
//  ChoosePFPView.swift
//  investment 101
//
//  Created by Celine Tsai on 29/1/24.
//

import SwiftUI

struct ChoosePFPView: View {
    @ObservedObject private var profileViewModel = ProfileViewModel()
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Text("Choose a profile picture")
                .font(.system(size:25))
            HStack {
                Button(action: {
                    profileViewModel.updatePFP("football")
                    isPresented = false
                }) {
                    Image(systemName: "football")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 120)
                        .foregroundColor(.black)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 160, height: 160) // Adjust the size of the circle
                        )
                }
                .padding(.horizontal)

                Button(action: {
                    profileViewModel.updatePFP("basketball")
                    isPresented = false
                }) {
                    Image(systemName: "basketball")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 120) // Adjust the size of the button
                        .clipShape(Circle())
                        .foregroundColor(.black)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 160, height: 160) // Keep the same size as the other circle
                        )
                }
                .padding(.horizontal)
            }
            .padding(.vertical)

            HStack {
                Button(action: {
                    profileViewModel.updatePFP("person")
                    isPresented = false
                }) {
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 120) // Adjust the size of the button
                        .foregroundColor(.black)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 160, height: 160) // Keep the same size as the other circle
                        )
                }
                .padding(.horizontal, 40)

                Button(action: {
                    profileViewModel.updatePFP("music.mic")
                    isPresented = false
                }) {
                    Image(systemName: "music.mic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 120) // Adjust the size of the button
                        .foregroundColor(.black)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 160, height: 160) // Keep the same size as the other circle
                        )
                }
                .padding(.horizontal, 30)
            }
            .padding(.vertical, 50)
            
            HStack {
                Button(action: {
                    profileViewModel.updatePFP("book")
                    isPresented = false
                }) {
                    Image(systemName: "book")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 120) // Adjust the size of the button
                        .foregroundColor(.black)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 160, height: 160) // Keep the same size as the other circle
                        )
                }
                .padding(.horizontal, 40)

                Button(action: {
                    profileViewModel.updatePFP("gamecontroller")
                    isPresented = false
                }) {
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 120) // Adjust the size of the button
                        .foregroundColor(.black)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 160, height: 160) // Keep the same size as the other circle
                        )
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}

