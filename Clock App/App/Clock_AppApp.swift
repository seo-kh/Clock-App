//
//  Clock_AppApp.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/22.
//

import SwiftUI

@main
struct Clock_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    @StateObject var timerControl = TimerControl()
    @StateObject var soundControl = SoundControl()
    

    var body: some Scene {
        WindowGroup {
            TimerView()
                .environmentObject(timerControl)
                .environmentObject(soundControl)
                .onAppear {
                    LocalNotificationManager.requestPermission()
                }
//            AlarmView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                    .onChange(of: scenePhase) { _ in
//                        persistenceController.save()
//                    }
        }
    }
}
