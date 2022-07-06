//
//  APIcall.swift
//  JSONparsing
//
//  Created by Truong Tommy on 4/3/22.
//

import SwiftUI

struct Milestone:Codable,Hashable {
    var id:UUID
    var name:String
    var extendedDescription : String
    var progress:Int
    var progressType:String
    var goals:[Int]
    var signature:Data
}

class ViewModel : ObservableObject {
    @Published var milestones = [Milestone]()
    
    func fetch() {
        guard let url = URL(string: "https://shuttletracker.app/milestones") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let milestones = try JSONDecoder().decode([Milestone].self, from: data)
                DispatchQueue.main.async {
                    self?.milestones = milestones
                }
            }catch {
                print(error)
            }

        }
        task.resume()
    }
}

struct APIcall: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.milestones,id: \.self) { milestone in
                    Text(milestone.extendedDescription)
                }
            }
            .navigationTitle("Milestones")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct APIcall_Previews: PreviewProvider {
    static var previews: some View {
        APIcall()
    }
}
