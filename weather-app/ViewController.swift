//
//  ViewController.swift
//  weather-app
//
//  Created by Regis Family on 3/8/16.
//  Copyright © 2016 Regis Family. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weather = Weather()
    var forecast = Forecast()
    
    @IBOutlet var backgroundImg: UIImageView!
    
    @IBOutlet var currentTempLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var cityLbl: UILabel!
    @IBOutlet var currentDescription: UILabel!
    
    @IBOutlet var day1Lbl: UILabel!
    @IBOutlet var day1MainDescLbl: UILabel!
    @IBOutlet var day1TempLbl: UILabel!
    @IBOutlet var day2Lbl: UILabel!
    @IBOutlet var day2MainDescLbl: UILabel!
    @IBOutlet var day2TempLbl: UILabel!
    @IBOutlet var day3Lbl: UILabel!
    @IBOutlet var day3MainDescLbl: UILabel!
    @IBOutlet var day3TempLbl: UILabel!
    @IBOutlet var day4Lbl: UILabel!
    @IBOutlet var day4MainDescLbl: UILabel!
    @IBOutlet var day4TempLbl: UILabel!
    @IBOutlet var day5Lbl: UILabel!
    @IBOutlet var day5MainDescLbl: UILabel!
    @IBOutlet var day5TempLbl: UILabel!
    
    let currentDate = NSDate()
    let dateFormatter = NSDateFormatter()
    let dayFormatter = NSDateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather.downloadWeather { () -> () in
            self.updateUI()
        }
        
        forecast.downloadForecast { () -> () in
            self.updateUI()
        }
        
         getCurrentDate()
    }
    
    func getCurrentDate () {
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        print(convertedDate)
        dateLbl.text = convertedDate
    }
    
    func updateUI() {
        currentTempLbl.text = weather.temperature
        cityLbl.text = weather.city
        currentDescription.text = weather.description.capitalizedString
        day1Lbl.text = forecast.day1
        day1MainDescLbl.text = forecast.day1MainDesc
        day1TempLbl.text = forecast.day1Temp
        day2Lbl.text = forecast.day2
        day2MainDescLbl.text = forecast.day2MainDesc
        day2TempLbl.text = forecast.day2Temp
        day3Lbl.text = forecast.day3
        day3MainDescLbl.text = forecast.day3MainDesc
        day3TempLbl.text = forecast.day3Temp
        day4Lbl.text = forecast.day4
        day4MainDescLbl.text = forecast.day4MainDesc
        day4TempLbl.text = forecast.day4Temp
        day5Lbl.text = forecast.day5
        day5MainDescLbl.text = forecast.day5MainDesc
        day5TempLbl.text = forecast.day5Temp
        
        // Change background image according to current weather conditions
        switch (weather.icon) {
        case "01d", "01n", "02d", "02n":
            self.backgroundImg.image = UIImage(named: "sun")
        case "03d", "03n", "04d", "04n":
            self.backgroundImg.image = UIImage(named: "cloud")
        case "09d", "09n", "10d", "10n", "11d", "11n", "50d", "50n":
            self.backgroundImg.image = UIImage(named: "rain")
        case "13d", "13n":
            self.backgroundImg.image = UIImage(named: "snow")
        default:
            self.backgroundImg.image = UIImage(named: "sun")
        }
    }
    

}

