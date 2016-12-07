//
//  WeatherVC.swift
//  rainyshinyapp
//
//  Created by Wellison Pereira on 7/30/16.
//  Copyright © 2016 Tora Cross. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherVC: UIViewController, CLLocationManagerDelegate {
    
    //Outlets
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    //Call the class to initialize to provide Weather data
    var currentWeather = CurrentWeather()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GPS Settings for best accuracy.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        
        let background = CAGradientLayer().blueGradient()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, at: 0)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        currentWeather = CurrentWeather()
        locationAuthStatus()

    }
    
    //request authorization to have location.
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            currentWeather.downloadWeatherDetails {
                self.updateMainUI()
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    

    
    

    
    //update UI with details from CurrentWeather.swift
    func updateMainUI() {
        
        dateLbl.text = currentWeather.date
        currentTempLbl.text = "\(currentWeather.currentTemp) °F"
        currentWeatherTypeLbl.text = currentWeather.weatherType
        locationLbl.text = currentWeather.cityName
       
        //passing in image, images named after weatherType, pass in currentweather.weathertype as a string by using named:
        currentWeatherImg.image = UIImage(named: currentWeather.weatherType)
        
    }
}
