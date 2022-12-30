//
//  Notification.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 29/12/2022.
//

import Foundation
import UserNotifications

func ScheduleNotification(body: String, time: TimeInterval) {
    let content = UNMutableNotificationContent()
    content.title = "Measure Your Blood Sugar 🩸"
    content.subtitle = body
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
   
    UNUserNotificationCenter.current().add(request)
}
