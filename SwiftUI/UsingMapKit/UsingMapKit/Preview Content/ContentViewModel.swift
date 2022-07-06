//
//  ContentViewModel.swift
//  UsingMapKit
//
//  Created by Truong Tommy on 3/9/22.
//
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 42.7298, longitude: -73.6789)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta:0.02, longitudeDelta: 0.02)
}

final class ContentViewModel:NSObject,ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    var locationManager : CLLocationManager?
     
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else  {
            print ("WTF")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely to due parent control or something")
        case .denied:
            print("Your location is denied, change it!")
        case .authorizedAlways,.authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? MapDetails.startingLocation  ,
                                        span: MapDetails.defaultSpan)
        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    
}
