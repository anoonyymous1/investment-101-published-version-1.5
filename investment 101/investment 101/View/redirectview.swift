//
//  SwiftUIView.swift
//  investment 101
//
//  Created by ian cheng on 1/23/24.
//
//
//import SwiftUI
//
//struct redirectview: View {
//    @AppStorage("rValue") var rValue = DefaultSettings.rValue //rgb values
//    @AppStorage("gValue") var gValue = DefaultSettings.gValue
//    @AppStorage("bValue") var bValue = DefaultSettings.bValue
//    var body: some View {
//        Rectangle()
//            .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
//            .edgesIgnoringSafeArea(.all)
//            .frame(height: 40)
//        List {
//            VStack{
//                NavigationLink(destination: stock_loading()) {
//                    HStack {
//                        Image("stockicon") // Replace with your image
//                            .resizable()
//                            .cornerRadius(10)
//                            .frame(width: 120, height: 120)
//                        
//                        VStack(alignment: .leading) {
//                            Text("Stock View")
//                                .font(.headline) // Style for primary text
//                            Text("View current stock trends") // Additional description
//                                .font(.subheadline) // Style for secondary text
//                        }
//                        .padding(.leading, 8)
//                    }
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//    }
//}
//struct stock_loading: View {
//    
//    @State var showSplash: Bool = false
//    
//    var body: some View {
//        ZStack {
//            if self.showSplash {
//                MainListView()
//            } else {
//                SplashScreenView()
//                    
//            }
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
//                withAnimation {
//                    self.showSplash = true
//                }
//            }
//        }
//    }
//}



//
//#Preview {
//    redirectview()
//}
