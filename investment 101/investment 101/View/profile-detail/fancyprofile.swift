//
//  ContentView.swift
//  Landmark
//
//  Created by Vatsal Kulshreshtha on 06/08/19.
//  Copyright © 2019 Vatsal Kulshreshtha. All rights reserved.
//

import SwiftUI

struct profile2: View {
    @ObservedObject var locationManager = LocationManager()
    @State var isPresented = false
    
    @AppStorage("rValue") var rValue = DefaultSettings.rValue //rgb values
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue
    
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("userlocation") var userlocation = DefaultSettings.userlocation
    @AppStorage("description") var description = DefaultSettings.description
    
    
    
    
    var body: some View {
        
        VStack(){
            Rectangle()
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 80)
            MapView().frame(height: 300)
            CircleImage().offset(y: -130).padding(.bottom, -150)
        
           VStack(alignment: .leading){
                Text(name)
                   .padding(.leading)
                    .font(.title)
             HStack() {
                    Text(userlocation) //location (country)
                    .font(.subheadline)
                    .padding(.leading)
                    Spacer()
                     Button (
                         action: { self.isPresented = true },
                         label: {
                             Label("Edit", systemImage: "pencil")
                     })
                     .padding(.trailing)
                     .sheet(isPresented: $isPresented, content: {
                         SettingsView()
                     })
                }
         
            }.padding()
            
            
        SocialMediaListView()
    }.edgesIgnoringSafeArea(.top)
    }
        
}

struct CircleImage: View {
    var body: some View {
          Image("default-profile")
            .resizable()
            .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
                     .clipShape(Circle())
                     .overlay(Circle().stroke(Color.white, lineWidth: 2))
                     .shadow(radius: 10)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        profile2()
    }
}
#endif
