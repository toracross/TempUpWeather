//
//  CurrentWeather.swift
//  rainyshinyapp
//
//  Created by Wellison Pereira on 7/30/16.
//  Copyright © 2016 Tora Cross. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire download data
        //URL Request
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            //JSON Data Converting
            if let dict = result.value as? Dictionary<String, AnyObject> {
                //City name - Single value in dict.
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                print(self._cityName)
                
                //Weather - has a library in a library, multiple dicts. This data is in the JSON proper.
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                print(self._weatherType)
                
                //Temperature - Ditto to Weather, but temp is in Kelvin, convert K to F before passing value.
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToFahrenheitPreDivision = (currentTemperature * (9/5) - 469.67)
                        let kelvintoFahrenheit = Double(round(10 * kelvinToFahrenheitPreDivision/10))
                        self._currentTemp = kelvintoFahrenheit
                    }
                }
                print(self._currentTemp)
                
            }
            completed()
        }
        
    }
    
}












