//
//  SchoolOpen.swift
//  MapKit-Intro-Lab
//
//  Created by Juan Ceballos on 2/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import CoreLocation

struct SchoolOpen: Codable   {
    
    let schoolName: String
    let latitude: String
    let longitude: String
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
    }
    
    enum CodingKeys: String, CodingKey, Codable  {
        case schoolName = "school_name"
        case latitude
        case longitude
    }
}

extension SchoolOpen    {
    static func fetchSchools() -> [SchoolOpen] {
        var schools = [SchoolOpen]()
        
        guard let fileURL = Bundle.main.url(forResource: "SchoolOpen", withExtension: "json")
            else    {
                fatalError()
        }
        
        do  {
            let data = try Data(contentsOf: fileURL)
            let schoolData = try JSONDecoder().decode([SchoolOpen].self, from: data)
            schools = schoolData
        }
        catch   {
            fatalError()
        }
        return schools
    }
}

