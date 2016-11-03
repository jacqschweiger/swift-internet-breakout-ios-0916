//
//  APIClient.swift
//  niftyFlatironWeather
//
//  Created by Robert Deans on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class APIClient {
    
    
    class func getInfo(completion: @escaping ([String:AnyObject]) -> Void) {
        
        let urlString = "\(Secrets.darkSkyAPI)\(Secrets.secretKey)/40.7057953,-74.0133809"
        
        let url = URL(string: urlString)
        
        
        
        if let unwrappedUrl = url {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: unwrappedUrl) { (data, response, error) in
                if let unwrappedData = data {
                    do {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String:AnyObject]
                        
                        completion(responseJSON)
                        
                    } catch {
                        print(error)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
