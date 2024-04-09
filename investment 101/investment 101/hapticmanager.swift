//
//  hapticmanager.swift
//  investment 101
//
//  Created by ian cheng on 1/25/24.
//

import Foundation
import SwiftUI

struct HapticManager {
    static let shared = HapticManager()

    func softFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func mediumFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    func hardFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    func rigidFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .rigid) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    func hardNotificationFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
}
