//
//  ProfileViewModel.swift
//  investment 101
//
//  Created by Celine Tsai on 14/12/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var namePresented: String {
        didSet {
            UserDefaults.namePresented = namePresented // Save to UserDefaults when updated
        }
    }
    @Published var profilePicName: String {
        didSet {
            UserDefaults.profilePicName = profilePicName // Save to UserDefaults when update
        }
    }

    init() {
        namePresented = UserDefaults.namePresented
        profilePicName = UserDefaults.profilePicName
    }
    
    func updateName(_ newValue: String) {
        namePresented = newValue
    }
    
    func updatePFP(_ newValue: String) {
        profilePicName = newValue
    }
    
    
}

extension UserDefaults {
    static var namePresented: String {
        get {
            return UserDefaults.standard.string(forKey: "name") ?? "" // Set a default value
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
    static var profilePicName: String{
        get{
            return UserDefaults.standard.string(forKey: "pfp") ?? "person.fill"
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "pfp")
        }
    }
}
