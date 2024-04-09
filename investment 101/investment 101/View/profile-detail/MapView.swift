//
//  MaoView.swift
//  Landmark
//
//  Created by Vatsal Kulshreshtha on 06/08/19.
//  Copyright © 2019 Vatsal Kulshreshtha. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let user_longitude = locationManager.userLongitude
        let user_latitude = locationManager.userLatitude
        let coordinate = CLLocationCoordinate2D(latitude: user_latitude ?? 1.33341667, longitude: user_latitude ?? 103.8406111)
        let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
      }
    
        
}//1°20'00.3"N 103°50'26.2"E

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var userLongitude: Double?
    @Published var userLatitude: Double?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLongitude = location.coordinate.longitude
            userLatitude = location.coordinate.latitude
        }
    }
}





#if DEBUG
struct MaoView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
