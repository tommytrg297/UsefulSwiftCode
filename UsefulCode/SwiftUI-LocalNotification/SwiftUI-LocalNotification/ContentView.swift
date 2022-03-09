//
//  ContentView.swift
//  SwiftUI-LocalNotification
//
//  Created by Truong Tommy on 2/15/22.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        
        
        VStack{
        Button("Request Permission") {
            UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.badge,.alert]) {
                success, error in
                if success {
                    print ("IT WORKS")
                }
                else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
            Button ("You are close to a bus") {
                let content = UNMutableNotificationContent()
                content.title = "Taking the RPI Shuttle?"
                content.subtitle = "Contribute by pressing 'Boardin Bus'!"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60*4, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        
        .padding()
        Button ("Board Bus") {
            let content = UNMutableNotificationContent()
            content.title = "Did you leave the bus?"
            content.subtitle = "Remember to tap “Leave Bus” next time"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
            
        .padding()
            
            Button("Cancel notification") {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
        
        
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
