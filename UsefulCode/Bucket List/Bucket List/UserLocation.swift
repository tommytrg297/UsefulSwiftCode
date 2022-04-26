//
//  UserLocation.swift
//  Bucket List
//
//  Created by Truong Tommy on 4/12/22.
//
import MapKit
import SwiftUI

struct UserLocation: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.7298, longitude: -73.6789),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
    @State private var locations = [Location]()
    @State private var selectedLocation : Location?
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion,annotationItems: locations) { location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                
                    
            }
                .ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        let newLocation = Location(id:  UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        locations.append(newLocation)
                        } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.3))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .sheet(item: $selectedLocation) {place in
            Text(place.name)
        }
    }
}

struct UserLocation_Previews: PreviewProvider {
    static var previews: some View {
        UserLocation()
    }
}
