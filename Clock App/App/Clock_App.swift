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
    @StateObject var timerViewModel = TimerViewModel()
    @StateObject var soundViewModel = SoundViewModel()
    @StateObject var alarmViewModel = AlarmViewModel()
    

    var body: some Scene {
        WindowGroup {
            TabView {
                
                TimerView() //: TIMER
                    .tabItem({
                        Label("타이머", systemImage: "timer")
                    })
                    .environmentObject(timerViewModel)
                    .environmentObject(soundViewModel)
                    .onAppear {
                        LocalNotificationManager.requestPermission()
                    }
                
                AlarmView() //: ALARM
                    .tabItem({
                        Label("알람", systemImage: "alarm.fill")
                    })
                    .environmentObject(soundViewModel)
                    .environmentObject(alarmViewModel)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .onChange(of: scenePhase) { _ in
                        persistenceController.save()
                    }
                
            } //: TAB
        }
    }
}
