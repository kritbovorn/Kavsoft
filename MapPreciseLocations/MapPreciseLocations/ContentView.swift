//
//  ContentView.swift
//  MapPreciseLocations
//
//  Created by Kritbovorn Taweeyossak on 25/8/2563 BE.
//
// https://www.youtube.com/watch?v=eDUErLFFgNo

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.691329, longitude: 100.464192), latitudinalMeters: 10000, longitudinalMeters: 10000)
    @State private var userTracking: MapUserTrackingMode = MapUserTrackingMode.follow
    @State private var locationManager: CLLocationManager = CLLocationManager()
    @StateObject var locationManagerDelegate = LocationManagerDelegate()
    
    var body: some View {
        
        VStack {
            
            Map(coordinateRegion: $region, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: $userTracking, annotationItems: locationManagerDelegate.pins) { (pin)  in
                
                MapPin(coordinate: pin.location.coordinate, tint: Color.red)
            }
        }
        .onAppear {
            locationManager.delegate = locationManagerDelegate
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

class LocationManagerDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var pins: [Pin] = []
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            print("Authorized!!!!!")
            
            if manager.accuracyAuthorization != .fullAccuracy {
                
                print("Reduce Accuracy!!!!!!")
                manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "Location") { (error) in
                    if error != nil {
                        print(error!)
                        return 
                    }
                }
            }
            
            manager.startUpdatingLocation()
        }
        else {
            print("Not Authorized Sir , So sadness!!!!")
            
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        pins.append(Pin(location: locations.last!))
    }
}

struct Pin: Identifiable {
    var id = UUID().uuidString
    var location: CLLocation
    
}
