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
    @StateObject var timerModel = TimerModel()
    

    var body: some Scene {
        WindowGroup {
//            TimerView()
////                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .environmentObject(timerModel)
//                .onAppear {
//                    LocalNotificationManager.requestPermission()
//                }
            CustomTimerPickerView()
        }
    }
}
