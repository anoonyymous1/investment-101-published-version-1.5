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

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}




