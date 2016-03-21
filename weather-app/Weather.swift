//
//  Weather.swift
//  weather-app
//
//  Created by Regis Family on 3/10/16.
//  Copyright © 2016 Regis Family. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    private var _temperature: String!
    private var _city: String!
    private var _description: String!
    private var _icon: String!
    private var _currentWeatherURL: String!
 
    var temperature: String {
        if _temperature == nil {
            _temperature = ""
        }
        return _temperature
    }
    
    var city: String {
        if _city == nil {
            _city = ""
        }
        return _city
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
       }
    
    var icon: String {
        if _icon == nil {
            _icon = ""
    }
        return _icon
    }
    
       
    init() {
       _currentWeatherURL = "\(URL_BASE)\(API_KEY)"
      
    }
    
    func downloadWeather(completed: DownloadComplete) {
        
        let url = NSURL(string: _currentWeatherURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                    if let city = dict["name"] as? String {
                        self._city = city
                    }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let temp = main["temp"] as? Double {
                        self._temperature = NSString(format: "%.0f\u{00B0}", temp) as String
                    }
                    
                    if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        
                        if let description = weather[0]["description"] as? String {
                            self._description = description
                        }
                        
                        if let icon = weather[0]["icon"] as? String {
                            self._icon = icon 
                        }
                    }
                }
                
            completed()
            }
        }
    }    
}


