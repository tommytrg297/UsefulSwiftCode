//
//  ContentView.swift
//  ProgressBar
//
//  Created by Truong Tommy on 3/15/22.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @State var dailyUsers = 56
    @State private var maximumDailyUser = 64
    @State  var newRecordfordailyUser = false
    @State var counter:Int = 0

    
    @State private var totalUsers = 12355
    
    @State var dailyShuttlesTracked = 12
    @State private var maxDailyShuttles = 23
    @State private var newRecordforBus = false
    
    @State var PersonProgressValue:Float = 0.5
    @State var BusProgressValue:Float = 0.2
    
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Thank you for contributing!")
                    .padding()
                
                Text("Daily amount of users : \(dailyUsers)")
                
                HStack {
                    Image(systemName: "person.fill")
                        .frame(width: 20, height: 20)
                    ProgressBar(value: $PersonProgressValue,filled: $newRecordfordailyUser)
                        .frame(height:20)
                }
                
                Text("Daily amount of users : \(dailyUsers)")
                
                
                Text("Bus tracked : \(dailyShuttlesTracked)")
                
                HStack {
                    Image(systemName: "bus.doubledecker")
                        .frame(width: 20, height: 20)
                    
                    ProgressBar(value: $BusProgressValue,filled:$newRecordforBus)
                        .frame(height:20)
                }
                

                Spacer(minLength: 80)
                
                Button("Board Bus") {
                    dailyUsers+=1
                    PersonProgressValue = Float(dailyUsers)/Float(maximumDailyUser)
                    if (dailyUsers==maximumDailyUser){
                        newRecordfordailyUser = true
                    }
                }
            }
            .padding()
        }
}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProgressBar : View {
    @Binding var value : Float
    @Binding var filled : Bool
    var body: some View{
        GeometryReader{geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.teal)
                

                if (filled == false){
                Rectangle()
                    .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width),
                           height: geometry.size.height)
                    .foregroundColor(.blue)
            }
                else {
                    Rectangle()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(1)
                        .foregroundColor(.green)
                }
            
            }
            .cornerRadius(7)

            
            
            
        }
        
    }
}


struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}
