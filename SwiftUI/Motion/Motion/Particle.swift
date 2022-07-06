//
//  Particle.swift
//  Motion
//
//  Created by Truong Tommy on 5/21/22.
//

import Foundation

struct Particle : Hashable {
    let x : Double
    let y : Double
    let creationDate = Date.now.timeIntervalSinceReferenceDate
    let hue : Double
}
