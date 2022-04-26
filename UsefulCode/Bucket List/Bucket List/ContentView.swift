//
//  ContentView.swift
//  Bucket List
//
//  Created by Truong Tommy on 4/10/22.
//

import SwiftUI
import MapKit


/*struct Location:Identifiable {
    let id = UUID()
    let name:String
    let coordinate:CLLocationCoordinate2D
}
 */


struct ContentView: View {
    @State private var MapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.7298, longitude: -73.6789),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    /*let location = [
        Location(name: "my house", coordinate: CLLocationCoordinate2D(latitude: 42.7398, longitude: -73.6798)),
        Location(name: "union", coordinate: CLLocationCoordinate2D(latitude: 42.74, longitude: -73.6790))
    ]
     
     */
    
    
    var body: some View {
        Text("Helo")
        /*
        NavigationView {
            Map(coordinateRegion: $MapRegion,annotationItems: location) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label : {
                        Circle()
                        .stroke(.blue,lineWidth: 10)
                        .frame(width: 20, height: 20)
                }
                }
                    
            }
            .ignoresSafeArea()
        }*/
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
