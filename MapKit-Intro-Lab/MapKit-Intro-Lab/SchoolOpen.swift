//
//  SchoolOpen.swift
//  MapKit-Intro-Lab
//
//  Created by Juan Ceballos on 2/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import CoreLocation

struct coordinate: Codable  {
    let latitude: String
    let longitude: String
}

struct SchoolOpen: Codable   {
    let schoolName: String
    let location: coordinate
    
    enum CodingKeys: String, CodingKey, Codable  {
        case schoolName = "school_name"
        case location
    }
}

extension SchoolOpen    {
    static func fetchSchools()  {
        
    }
}

