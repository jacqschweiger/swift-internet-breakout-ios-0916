//
//  Forecast.swift
//  niftyFlatironWeather
//
//  Created by Robert Deans on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class Forecast {
    var currentTemperature: Double
    var currentSummary: String
    
    
    init(dictionary: [String : AnyObject]) {
        self.currentTemperature = dictionary["temperature"] as! Double
        self.currentSummary = dictionary["summary"] as! String
    }
     
}
