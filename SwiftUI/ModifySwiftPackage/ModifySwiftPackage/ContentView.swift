//
//  ContentView.swift
//  ModifySwiftPackage
//
//  Created by Truong Tommy on 7/6/22.
//

import SwiftUI
import SegmentedPicker

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State private var selection:Int = 0
    var body: some View {
        VStack{
            SegmentedPicker("Pick a color", items: vm.names, selection: $vm.selection)
                .backgroundColor(vm.selectedColor)
                .padding()
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
