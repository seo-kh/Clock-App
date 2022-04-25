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
    var timerControl = TimerControl()
    var soundControl = SoundControl()

    var body: some Scene {
        WindowGroup {
            TimerView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(timerControl)
                .environmentObject(soundControl)
        }
    }
}
