//
//  ContentView.swift
//  UsefulCode
//
//  Created by Truong Tommy on 3/9/22.
//

import SwiftUI

struct StepperView: View {
    @State var SleepAmount = 8.0 // Int, try with Double
    @State var widthIncrement:CGFloat = 0
    
    
    var body: some View {
        
        // Description, bindin to var, range, steps
       
        VStack {
            Stepper("\(SleepAmount.formatted()) hours",value: $SleepAmount,in: 4...12,step: 0.25)
                .padding(20)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + CGFloat(widthIncrement), height: 100)
            
            Stepper("Stepper 2") {
                increaseWidth(amount: 30)
            } onDecrement: {
                increaseWidth(amount: -30)//decrement
            }
        }
        
    }
    func increaseWidth(amount:CGFloat){
        withAnimation(.easeInOut){
            widthIncrement += amount
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
