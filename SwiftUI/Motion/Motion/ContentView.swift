//
//  ContentView.swift
//  Motion
//
//  Created by Truong Tommy on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var particleSystem = ParticleSystem()
    let options: [(flipX:Bool, flipY:Bool)] = [
        (false,false),(true,true),(false,false),(true,true)
    ]
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas {context,size in
                let timelineDate = timeline.date.timeIntervalSinceReferenceDate
                particleSystem.update(time: timelineDate)
                context.blendMode = .plusLighter
                
                
                for particle in particleSystem.particles {
                    let xPos = particle.x * size.width
                    let yPos = particle.y * size.height
                    
                    var contextCopy = context
                    
                    contextCopy.addFilter(.colorMultiply(Color(hue: particle.hue, saturation: 1, brightness: 1)))
                    contextCopy.opacity = 1 - (timelineDate - particle.creationDate)
                    contextCopy.draw(particleSystem.image,at: CGPoint(x: xPos, y: yPos))
                }
                
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ drag in
                    particleSystem.center.x = drag.location.x / UIScreen.main.bounds.width
                    particleSystem.center.y = drag.location.y / UIScreen.main.bounds.height
                })
        )
        .ignoresSafeArea()
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
