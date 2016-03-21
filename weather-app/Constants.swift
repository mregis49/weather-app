//
//  Constants.swift
//  weather-app
//
//  Created by Regis Family on 3/8/16.
//  Copyright © 2016 Regis Family. All rights reserved.
//



import Foundation

let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?id=5777107&units=imperial"
let FORECAST_URL_BASE = "http://api.openweathermap.org/data/2.5/forecast/daily?id=5777107&units=imperial"
let API_KEY = "&appid=21c8b27d2e701ab5076c39eb5f0b6827"

typealias DownloadComplete = () -> ()