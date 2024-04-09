//
//  ProfileView.swift
//  investment 101
//
//  Created by Celine Tsai on 25/7/23.
//

import SwiftUI

struct ProfileView: View {
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
            ZStack{
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 210, height: 210)
                    .offset(y: -130)
                    .padding(.bottom, -150)

                CircleImage()
                    .offset(y: -130)
                    .padding(.bottom, -150)
            }
            
        
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
            
            HStack {
                VStack {
                    Text(String(UserDefaults.xpPoints))
                        .font(.title)
                        .bold()
                                            
                    Text("Points")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 2)
        
        }
        .edgesIgnoringSafeArea(.top)
        .padding(.top, -150)
    }
        
}

struct CircleImage: View {
    @State private var profilePicName = UserDefaults.standard.string(forKey: "pfp")
    var body: some View {
        Image(systemName: profilePicName ?? "person.circle")
            .resizable()
            .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
                    
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
