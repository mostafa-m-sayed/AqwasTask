//
//  LocationManager.swift
//  Reach_Network
//
//  Created by mac on 2/19/19.
//  Copyright © 2019 Reach. All rights reserved.
//

import MapKit
import UIKit
import CoreLocation
protocol LocationUpdated: class {
    func didUpdateLocation(initializing: Bool)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    weak var delegate: LocationUpdated?
    static var currentLocation: CLLocation?
    var initializing: Bool = false
    func startLocationTracking(initializing: Bool = false) {
        if locationManager == nil {
            locationManager = CLLocationManager()
        }
        locationManager.delegate = self
        self.initializing = initializing
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        LocationManager.currentLocation = location
        delegate?.didUpdateLocation(initializing: initializing)
        if locationManager != nil {
            locationManager.stopUpdatingLocation()
        }
        locationManager = nil
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
}
