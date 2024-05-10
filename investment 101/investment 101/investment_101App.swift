//
//  investment_101App.swift
//  investment 101
//
//  Created by Celine Tsai on 14/12/23.
//

import SwiftUI

@main
struct investment_101App: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(appState)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}




