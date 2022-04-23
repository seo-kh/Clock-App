//
//  Clock_AppApp.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/22.
//

import SwiftUI

@main
struct Clock_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
