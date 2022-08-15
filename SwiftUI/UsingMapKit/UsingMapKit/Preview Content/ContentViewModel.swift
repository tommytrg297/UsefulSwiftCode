//
//  ContentViewModel.swift
//  UsingMapKit
//
//  Created by Truong Tommy on 3/9/22.
//
import MapKit


enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 21.0278, longitude: 105.8342)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta:0.15, longitudeDelta: 0.15)
}

final class ContentViewModel:NSObject,ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    var locationManager =  CLLocationManager()
     
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
        } else  {
            print ("WTF")
        }
    }
    
    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
    
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely to due parent control or something")
        case .denied:
            print("Your location is denied, change it!")
        case .authorizedAlways,.authorizedWhenInUse:
            locationManager.requestLocation()
            print(locationManager.location)
            region.center = locationManager.location?.coordinate ?? MapDetails.startingLocation
        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        region = MKCoordinateRegion(center: locations.last!.coordinate ,
                                    span: MapDetails.defaultSpan)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
