//
//  SettingsView.swift
//  SettingsView
//
//  Created by Patrick Mifsud on 25/8/21.
//  Copyright © 2021 Patrick Mifsud. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                HeaderBackgroundSliders()
                ProfileSettings()
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                trailing: Button(
                    action: {
                        HapticManager.shared.softFeedback()
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Text("Done")
                            .padding(.trailing)
                    }
                )
            )
        }
    }
}

struct ProfileSettings: View {
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("userlocation") var userlocation = DefaultSettings.userlocation
    @AppStorage("description") var description = DefaultSettings.description
    @State private var presentPfpView = false
    @State private var profilePicName = UserDefaults.standard.string(forKey: "pfp")

    var body: some View {
        Section(header: Text("Profile")) {

            TextField("Name", text: $name)
            TextField("Location", text: $userlocation)

            TextField("About me", text: $description)

            Button(action: {
                HapticManager.shared.hardFeedback()
                presentPfpView = true
            }) {
                Text("Pick Profile Image")
            }
            .sheet(isPresented: $presentPfpView) {
                ChoosePFPView(isPresented: $presentPfpView)
            }
        }
    }
}

struct HeaderBackgroundSliders: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue

    var body: some View {
        Section(header: Text("Header Background Color")) {
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                }

                VStack {
                    colorSlider(value: $rValue, textColor: .red)
                    colorSlider(value: $gValue, textColor: .green)
                    colorSlider(value: $bValue, textColor: .blue)
                }
            }
        }
    }
}

struct colorSlider: View {
    @Binding var value: Double
    var textColor: Color

    var body: some View {
        HStack {
            Text(verbatim: "0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0.0...1.0)
            Text(verbatim: "255")
                .foregroundColor(textColor)
        }
    }
}

enum DefaultSettings {
    // Color Slider Values
    static var rValue: Double = 150.0
    static var gValue: Double = 150.0
    static var bValue: Double = 150.0

    // Profile
    static var name: String = "User"
    static var userlocation: String = "Somewhere in the world"
    static var description: String = ""
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

