//
//  ContentView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI
import UIKit
import UserNotifications

struct ContentView: View {
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){success, error in
            if success {
                print("Permission all set !")
            }else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        ScheduleNotification(body: "it been 2 hours since your last record", time: 5)
    }
    var body: some View {
        TabView{
            RecordsList()
                .tabItem{
                    Label(
                        "records", systemImage: "eye.circle.fill"
                    )
                }
            AddRecordView()
                .tabItem{
                    Label("add", systemImage: "plus.circle")
                }
        }
        .preferredColorScheme(.dark)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
