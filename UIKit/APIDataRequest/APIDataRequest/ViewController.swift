//
//  ViewController.swift
//  APIDataRequest
//
//  Created by Truong Tommy on 7/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=2022-06-15"
        getData(from: url)
        

    }
    
    private func getData(from url : String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, reponse, error in
            guard let data = data,error == nil else {
                print("error")
                return
            }
            // if we have data
            var result : Response?
            do {
                result = try? JSONDecoder().decode(Response.self, from: data)
            }catch{
                print("ERROR \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            print(json.status)
            print(json.results)
            print(json.results.dayLength)
            print(json.results.civilTwilightBegin)
            

        }
        task.resume()
    }
    
    
    
    
    struct Response : Codable {
        let results : MyResult
        let status : String
    }
    
    struct MyResult :Codable {
        let sunrise, sunset, solarNoon : String
        let dayLength: Int
        let civilTwilightBegin, civilTwilightEnd, nauticalTwilightBegin, nauticalTwilightEnd: String
        let astronomicalTwilightBegin, astronomicalTwilightEnd: String
    }
    
    

}

