//
//  ViewController.swift
//  MapKit-Intro-Lab
//
//  Created by Juan Ceballos on 2/24/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationSession = CoreLocationSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        loadMapViews()
    }
    
    func makeAnnotations() -> [MKPointAnnotation]   {
        var annotations = [MKPointAnnotation]()
        for school in SchoolOpen.fetchSchools() {
            let annotation = MKPointAnnotation()
            annotation.coordinate = school.coordinate
            annotation.title = school.schoolName
            annotations.append(annotation)
        }
        return annotations
    }
    
    private func loadMapViews() {
        let annotations = makeAnnotations()
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
    }
}



