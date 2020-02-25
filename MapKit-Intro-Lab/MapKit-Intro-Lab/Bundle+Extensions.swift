//
//  Bundle+Extensions.swift
//  MapKit-Intro-Lab
//
//  Created by Juan Ceballos on 2/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

extension Bundle    {
    static func readRawJSONData(filename: String, ext: String) -> Data  {
        
        guard let sourceURL = Bundle.main.url(forResource: filename, withExtension: ext)
            else    {
                fatalError()
        }
        
        var data: Data!
        
        do  {
            data = try Data.init(contentsOf: sourceURL)
        }
        catch   {
            fatalError()
        }
        return data
    }
}
