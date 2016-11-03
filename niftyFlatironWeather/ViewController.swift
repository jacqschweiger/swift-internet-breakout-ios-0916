//
//  ViewController.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/27/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    @IBOutlet weak var currentSummary: UILabel!
    
    @IBOutlet weak var currentTemp: UILabel!
    
    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
    var tempText = ""
    var summaryText = ""
    
    var store = DataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        
        print("view did load called")
       
        store.getCurrentDataFromAPI {
            
            self.tempText = "It's \(self.store.forecasts[0].currentTemperature) degrees Fahrenheit."
            self.summaryText = "The weather is \(self.store.forecasts[0].currentSummary)."
            print(self.store.forecasts[0].currentTemperature)
            print(self.store.forecasts[0].currentSummary)
            
            self.currentSummary.text = self.summaryText
            self.currentTemp.text = self.tempText

        }
        
        
        
        
        print("****\(currentSummary.text)")
        print(currentTemp.text)

    }
    
}


extension ViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if let unwrappedlatitude = locationManager.location?.coordinate.latitude, let unwrappedLongitude = locationManager.location?.coordinate.longitude{
            self.latitude = unwrappedlatitude
            self.longitude = unwrappedLongitude
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

