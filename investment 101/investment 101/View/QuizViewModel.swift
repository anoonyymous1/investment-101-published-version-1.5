//
//  QuizViewModel.swift
//  investment 101
//
//  Created by Celine Tsai on 28/10/23.
//

import SwiftUI
import Foundation

extension UserDefaults {
    static var xpPoints: Int {
        get {
            return UserDefaults.standard.integer(forKey: "XP")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "XP")
        }
    }

    static var unlockedTopicIDs: [Int] {
        get {
            return UserDefaults.standard.object(forKey: "UnlockedTopicIDs") as? [Int] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "UnlockedTopicIDs")
        }
    }

}

class QuizViewModel: ObservableObject {
    @Published var xpPoints: Int {
        didSet {
            UserDefaults.xpPoints = xpPoints // Save to UserDefaults when updated
        }
    }
    @Published var unlockedTopicIDs: Set<Int> {
        didSet {
            UserDefaults.unlockedTopicIDs = Array(unlockedTopicIDs)
        }
    }

    init() {
        xpPoints = UserDefaults.xpPoints // Load XP points from UserDefaults
        let storedUnlockedTopicIDs = UserDefaults.unlockedTopicIDs as [Int]
        unlockedTopicIDs = Set(storedUnlockedTopicIDs.isEmpty ? [1] : storedUnlockedTopicIDs)
    }

    func updateXPPoints(_ newValue: Int) {
        xpPoints += newValue
    }
    
    func updateUnlockedTopicIDs(_ nextTopicID: Int) {
        unlockedTopicIDs.insert(nextTopicID)
    }
}

