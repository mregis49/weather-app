//
//  Forecast.swift
//  weather-app
//
//  Created by Regis Family on 3/18/16.
//  Copyright © 2016 Regis Family. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    private var _day1: String!
    private var _day1MainDesc: String!
    private var _day1Temp: String!
    private var _day2: String!
    private var _day2MainDesc: String!
    private var _day2Temp: String!
    private var _day3: String!
    private var _day3MainDesc: String!
    private var _day3Temp: String!
    private var _day4: String!
    private var _day4MainDesc: String!
    private var _day4Temp: String!
    private var _day5: String!
    private var _day5MainDesc: String!
    private var _day5Temp: String!
    private var _forecastURL: String!    
    
    var day1: String {
        if _day1 == nil {
            _day1 = ""
        }
        return _day1
    }
    
    var day1MainDesc: String {
        if _day1MainDesc == nil {
            _day1MainDesc = ""
        }
        return _day1MainDesc
    }
    
    var day1Temp: String {
        if _day1Temp == nil {
            _day1Temp = ""
        }
        return _day1Temp
    }
    
    var day2: String {
        if _day2 == nil {
            _day2 = ""
        }
        return _day2
    }
    
    var day2MainDesc: String {
        if _day2MainDesc == nil {
            _day2MainDesc = ""
        }
        return _day2MainDesc
    }
    
    var day2Temp: String {
        if _day2Temp == nil {
            _day2Temp = ""
        }
        return _day2Temp
    }
    
    var day3: String {
        if _day3 == nil {
            _day3 = ""
        }
        return _day3
    }
    
    var day3MainDesc: String {
        if _day3MainDesc == nil {
            _day3MainDesc = ""
        }
        return _day3MainDesc
    }
    
    var day3Temp: String {
        if _day3Temp == nil {
            _day3Temp = ""
        }
        return _day3Temp
    }
    
    var day4: String {
        if _day4 == nil {
            _day4 = ""
        }
        return _day4
    }
    
    var day4MainDesc: String {
        if _day4MainDesc == nil {
            _day4MainDesc = ""
        }
        return _day3MainDesc
    }
    
    var day4Temp: String {
        if _day4Temp == nil {
            _day4Temp = ""
        }
        return _day4Temp
    }
    
    var day5: String {
        if _day5 == nil {
            _day5 = ""
        }
        return _day5
    }
    
    var day5MainDesc: String {
        if _day5MainDesc == nil {
            _day5MainDesc = ""
        }
        return _day5MainDesc
    }
    
    var day5Temp: String {
        if _day5Temp == nil {
            _day5Temp = ""
        }
        return _day5Temp
    }
    
    init() {
        _forecastURL = "\(FORECAST_URL_BASE)\(API_KEY)"
    }
    
    func downloadForecast(completed: DownloadComplete) {
        
        let url = NSURL(string: self._forecastURL)!
        Alamofire.request(.GET, url).responseJSON { response in
    
            let result = response.result
    
            if let dict = result.value as? Dictionary<String, AnyObject> {
    
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] where list.count > 0 {
                    
                    if let dt = list[0]["dt"] as? Double {
                        let date = NSDate(timeIntervalSince1970: dt)
                        let dayFormatter = NSDateFormatter()
                        dayFormatter.dateFormat = "EEE"
                        self._day1 = dayFormatter.stringFromDate(date)
                    }
                    
                    if let dt = list[1]["dt"] as? Double {
                        let date = NSDate(timeIntervalSince1970: dt)
                        let dayFormatter = NSDateFormatter()
                        dayFormatter.dateFormat = "EEE"
                        self._day2 = dayFormatter.stringFromDate(date)
                    }
                    
                    if let dt = list[2]["dt"] as? Double {
                        let date = NSDate(timeIntervalSince1970: dt)
                        let dayFormatter = NSDateFormatter()
                        dayFormatter.dateFormat = "EEE"
                        self._day3 = dayFormatter.stringFromDate(date)
                    }
                    
                    if let dt = list[3]["dt"] as? Double {
                        let date = NSDate(timeIntervalSince1970: dt)
                        let dayFormatter = NSDateFormatter()
                        dayFormatter.dateFormat = "EEE"
                        self._day4 = dayFormatter.stringFromDate(date)
                    }
                    
                    if let dt = list[4]["dt"] as? Double {
                        let date = NSDate(timeIntervalSince1970: dt)
                        let dayFormatter = NSDateFormatter()
                        dayFormatter.dateFormat = "EEE"
                        self._day5 = dayFormatter.stringFromDate(date)
                    }
                    
                    
                    if let temp = list[0]["temp"] as? Dictionary<String, Double>  {
                        if let temperature = temp["day"] {
                            self._day1Temp = NSString(format: "%.0f\u{00B0}", temperature) as String
                        }
                    }
                    
                    if let temp = list[1]["temp"] as? Dictionary<String, Double> {
                        if let temperature = temp["day"] {
                            self._day2Temp = NSString(format: "%.0f\u{00B0}", temperature) as String
                        }
                    }
                    
                    if let temp = list[2]["temp"] as? Dictionary<String, Double>  {
                        if let temperature = temp["day"] {
                            self._day3Temp = NSString(format: "%.0f\u{00B0}", temperature) as String
                        }
                    }
                    
                    if let temp = list[3]["temp"] as? Dictionary<String, Double>  {
                        if let temperature = temp ["day"] {
                            self._day4Temp = NSString(format: "%.0f\u{00B0}", temperature) as String
                        }
                    }
                    
                    if let temp = list[4]["temp"] as? Dictionary<String, Double> {
                        if let temperature = temp["day"] {
                            self._day5Temp = NSString(format: "%.0f\u{00B0}", temperature) as String
                        }
                    }
                    
                    if let weather = list[0]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        
                        if let desc = weather[0]["main"] as? String {
                            self._day1MainDesc = desc
                        }
                    }
                    
                    if let weather = list[1]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        if let desc = weather[0]["main"] as? String {
                            self._day2MainDesc = desc
                        }
                    }
                    
                    if let weather = list[2]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        if let desc = weather[0]["main"] as? String {
                            self._day3MainDesc = desc
                        }
                    }
                    
                    if let weather = list[3]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        if let desc = weather[0]["main"] as? String {
                            self._day4MainDesc = desc
                        }
                    }
                    
                    if let weather = list[4]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        if let desc = weather[0]["main"] as? String {
                            self._day5MainDesc = desc
                        }
                    }
  
                }
        
            }
            completed()
        }
    }
}
     