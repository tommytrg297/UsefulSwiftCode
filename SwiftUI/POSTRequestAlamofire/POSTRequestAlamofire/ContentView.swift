//
//  ContentView.swift
//  POSTRequestAlamofire
//
//  Created by Truong Tommy on 7/23/22.
//
import Alamofire
import SwiftUI

let fileUrl = Bundle.main.path(forResource: "cccd", ofType: "json")!
let data = try? Data(contentsOf: URL(fileURLWithPath: fileUrl))
let json = try? JSONSerialization.jsonObject(with: data!)

struct ContentView: View {
    @State var myname = "WWDC"
    var body: some View {
        VStack {
            Text(fileUrl)
            Text(myname)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


