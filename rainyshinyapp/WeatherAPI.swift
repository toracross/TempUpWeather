//
//  WeatherAPI.swift
//  rainyshinyapp
//
//  Created by Wellison Pereira on 7/30/16.
//  Copyright © 2016 Tora Cross. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&units=imperial&appid=0eb34adc13052c57ab9167a250b8fcf0"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&units=imperial&cnt=10&mode=json&appid=0eb34adc13052c57ab9167a250b8fcf0"

