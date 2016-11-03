//
//  DataStore.swift
//  niftyFlatironWeather
//
//  Created by Robert Deans on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class DataStore {
    
    static let sharedInstance = DataStore()
    
    private init() {}
    
    var forecasts = [Forecast]() //only currently, so only will include 1
    
    func getCurrentDataFromAPI(completion: @escaping ()->() ) {
        
        APIClient.getInfo { (dictionary) in //dictionary = [String: AnyObject]
            for repo in dictionary {
                let newRepo = Forecast(dictionary: dictionary["currently"] as! [String : AnyObject])
                self.forecasts.append(newRepo)
                
            }
            
            completion()
        }
    }
}
