import Cocoa
import Foundation
import Darwin


let elements = ["red","blue","orange","blue","yellow","black","blue","white"]

var elementsDictionnary = [String:Int]()

func getMostcommonColor (array : [String]) ->[String] {
    var elementsDictionnary : [String:Int] = [:]
    var topColors : [String] = []
    
    for color in elements {
        if let count = elementsDictionnary[color] {
            elementsDictionnary[color] = count+1
        } else {
            elementsDictionnary[color] = 1
        }
    }
    
    let highval = elementsDictionnary.values.max()
    
    for (color,count) in elementsDictionnary {
        if elementsDictionnary[color] == highval {
            topColors.append(color)
        }
    }
    return topColors
}

var result1 = getMostcommonColor(array: elements)
for i in result1 {
    print(i)
}
