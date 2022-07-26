//
//  ContentView.swift
//  CircleFill
//
//  Created by Truong Tommy on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    @State  var progress : CGFloat = 0
    var body: some View {
        ZStack{
            Color.blue
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.3),
                            style: StrokeStyle(lineWidth : 30))
                    .shadow(radius: 5)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.green,
                            style: StrokeStyle(lineWidth : 30))
                    .rotationEffect(.degrees(270))
                Text("$\(Int(self.progress*1000))")
                    .foregroundColor(.white)
                    .font(.system(size: 52))
            }
            .padding(50)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 2)) {
                progress += 0.1
            }
            for x in 0...100 {
                DispatchQueue.main.asyncAfter(deadline: .now()+TimeInterval(x/10)) {
                    self.progress += 0.01
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
