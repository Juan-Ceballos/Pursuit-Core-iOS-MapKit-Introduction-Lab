//
//  CoreLocationSession.swift
//  MapKit-Intro-Lab
//
//  Created by Juan Ceballos on 2/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import CoreLocation

// base class for most objc objects
// would inherit in swift if want to make your obj objc object

class CoreLocationSession: NSObject {
    
    // instance of type CLLocationManager
    public var locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        startSignificantLocationChange()
    }
    
    private func startSignificantLocationChange()   {
        // checks first to see if sign loc change avail on device
        if !CLLocationManager.significantLocationChangeMonitoringAvailable()    {
            return
        }
        
        // instance method of locationManager which instance of CLLocationManager
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
}

extension CoreLocationSession: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        default:
            break
        }
    }
}

