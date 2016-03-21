//
//  Constants.swift
//  weather-app
//
//  Created by Regis Family on 3/8/16.
//  Copyright © 2016 Regis Family. All rights reserved.
//

//<a href='http://www.freepik.com/free-vector/the-best-summer-background_791862.htm'>Designed by Freepik</a>
//<a href='http://www.freepik.com/free-vector/cloud-background_783216.htm'>Designed by Freepik</a>

import Foundation

//http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=44db6a862fba0b067b1930da0d769e98
//http://api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID={APIKEY}

let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?id=5777107&units=imperial"
let FORECAST_URL_BASE = "http://api.openweathermap.org/data/2.5/forecast/daily?id=5777107&units=imperial"
let API_KEY = "&appid=21c8b27d2e701ab5076c39eb5f0b6827"

typealias DownloadComplete = () -> ()