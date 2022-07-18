//
//  LocalNotificationManager.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/29.
//

import Foundation
import UserNotifications

struct Notification {
    var id: String
    var title: String
    var subTitle: String
}


class LocalNotificationManager {
    var notifications = [Notification]()
    
    var soundString: String?
    var soundDuration: TimeInterval?
    var timer = Timer()
    
    init(_ soundString: String?, _ soundDuration: TimeInterval?) {
        self.soundString = soundString
        self.soundDuration = soundDuration
    }
    
    func startTimer() {
        let timeInterval = soundDuration ?? 10.0
        if !timer.isValid {
            timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { timer in
                self.scheduleNotifications()
            })
        }
    }
    
    func stopTimer() {
        timer.invalidate()
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    static func requestPermission() {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(
                options: [.alert, .badge, .sound]) { granted, error in
                    if granted && error == nil {
                        // Success!!
                    }
                }
    }
    
    func addNotification(title: String, subTitle: String) {
        notifications.append(Notification(id: UUID().uuidString, title: title, subTitle: subTitle))
    }
    
    func scheduleNotifications() {
        for notification in notifications {
            
            // content Setting
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.subtitle = notification.subTitle
            
            if let soundString = soundString {
                let notificationSoundName = UNNotificationSoundName(soundString)
                content.sound = UNNotificationSound(named: notificationSoundName)
            }
            
            // trigger Setting
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
            
            // request Setting
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter
                .current()
                .add(request)
            
        }
    }
    
    func schedule() {
        UNUserNotificationCenter
            .current()
            .getNotificationSettings { settings in
                switch settings.authorizationStatus {
                case .authorized, .provisional:
                    self.scheduleNotifications()
                default:
                    Self.requestPermission()
                
                }
            }
    }
}
