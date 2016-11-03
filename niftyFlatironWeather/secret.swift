//
//  secret.swift
//  niftyFlatironWeather
//
//  Created by Robert Deans on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

struct Secrets {
    static let secretKey = "2edcd9cf4ed5ca86f331fc7bfa5241f9"
    
    static let darkSkyAPI = "https://api.darksky.net/forecast/"
    
    static let urlString = "\(darkSkyAPI)\(secretKey)/40.7057953,-74.0133809"
}

