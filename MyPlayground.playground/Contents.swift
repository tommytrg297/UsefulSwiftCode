import Cocoa
import Foundation
import Darwin


protocol Vehicle{
    func estimateTime(for distance:Int)-> Int
    
    func travel(distance:Int)
    
    
}
func commute(distance:Int, using vehicle:Car) {
    
}
