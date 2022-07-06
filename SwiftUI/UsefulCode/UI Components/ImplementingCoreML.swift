//
//  ImplementingCoreML.swift
//  UsefulCode
//
//  Created by Truong Tommy on 3/10/22.
//

import CoreML
import SwiftUI


struct ImplementingCoreML: View {
    @State private var wakeUp = Date.now
    @State private var coffee = 1
    @State private var sleepAmount = 8.0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("When do you want to wake up")
                    .font(.headline)
                
                DatePicker("Enter Time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .padding()
                    .labelsHidden()
                
                Text("How many hours")
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12,step: 0.25)
                    .padding()
                
                Text("How much coffee")
                Stepper(coffee==1 ? "1 cup" : "\(coffee) cups",value: $coffee,in: 1...20)
                    .padding()
                
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate",action: CalculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("Ok"){}
            }
        message: {
            Text(alertMessage)
        }
        }
       
    }
        
    func CalculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: Double(coffee))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        }
        catch {
            alertTitle = "Something wrong!"
            alertMessage = "could not calculate the sleeptime"
        }
        showingAlert = true
        
    }
}

struct ImplementingCoreML_Previews: PreviewProvider {
    static var previews: some View {
        ImplementingCoreML()
    }
}
