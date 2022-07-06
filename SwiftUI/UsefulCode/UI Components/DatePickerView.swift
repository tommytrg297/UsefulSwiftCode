//
//  DatePickerView.swift
//  UsefulCode
//
//  Created by Truong Tommy on 3/9/22.
//

import SwiftUI

struct DatePickerView: View {
    @State private var wakeUp = Date.now
    
    
    var body: some View {
        VStack{
            
        DatePicker("Choose a date",selection: $wakeUp,displayedComponents:.hourAndMinute)
            // show specific components
                .padding()
            
        DatePicker("Enter time",selection: $wakeUp,in: Date.now...)
            //this allows users to only choose dates in the future!
                .padding()
            
            
        Text(Date.now.formatted())
                .padding()
        Text(Date.now,format: .dateTime.timeZone().hour().minute())
                .padding()
        Text(Date.now,format: .dateTime.hour().minute())
                .padding()
        Text(Date.now.formatted(date: .abbreviated, time: .complete))
                .padding()
            
        
        
        }
    }
    
        // not optimal
    func date1() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
    }
    
    func date2() {
        var date_components = DateComponents()
        date_components.hour = 8
        date_components.minute = 0
        let date = Calendar.current.date(from: date_components) ?? Date.now
        // get the correct date in the current setting (correct regardless of time zones,countries ... )
        // optional, so if it fails get the current date
    }
    
    func date3() {
        // first get the components
        let components = Calendar.current.dateComponents([.hour,.minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
    
    
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
