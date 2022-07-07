//
//  ViewModel.swift
//  ModifySwiftPackage
//
//  Created by Truong Tommy on 7/6/22.
//
import SwiftUI

class ViewModel : ObservableObject {
    var colors = [myColor]()
    @Published var selection:Int = 0
    var names = [String]()
    var selectedColor:Color {
        colors[selection].color
    }
    
    init() {
        colors = myColor.mockColors
        names = colors.map{ $0.name }
    }
}
