//
//  ContentView.swift
//  JSONparsing
//
//  Created by Truong Tommy on 4/1/22.
//

import SwiftUI

//the very unique ShuttleTracker

struct Milestone:Codable {
    var id:UUID
    var name:String
    var extendedDescription : String
    var progress:Int
    var progressType:String
    var goals:[Int]
    var signature:Data
}
struct ContentView: View {
    
    @State var milestones = [Milestone]()
    
    var body: some View {
            List(milestones, id :\.id) { item in
                VStack(alignment: .leading) {
                    Text("Total amount of milestones : \(milestones[1].name)")
                    Text(item.name)
                    Text("Our progress is : \(item.progress)")
                    Text("The description is \(item.progressType)")
                    }
                }
            .task {
                await loadData()
            }
        }
    
    func loadData() async {
        guard let url = URL(string: "https://shuttletracker.app/milestones")
        else {
            print("RIP milestones")
            return
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Milestone].self, from: data){
                milestones = decodedResponse
            }
        } catch {
            print("INVALID DATA")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
