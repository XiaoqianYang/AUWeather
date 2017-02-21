//
//  WeatherService.swift
//  AUWeather
//
//  Created by Xiaoqian Yang on 20/2/17.
//  Copyright © 2017 XiaoqianYang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherService {
    static let shared = WeatherService()

    private let urlPath = "http://api.openweathermap.org/data/2.5/group"
    private let appId = "b9a2eba6fbe31cfae0132e266c8630c0"
    
    private init() {
        
    }
    
    func getWeatherByCityIds(city : NSArray, completion: @escaping (_ weathers: NSArray) -> Void ){
        let cities = city.componentsJoined(by: ",")
        let fullUrl = "\(urlPath)?id=\(cities)&APPID=\(appId)&units=metric"
        Alamofire.request(fullUrl)
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        completion(self.getWeathersByJSON(json: json))
                    }
                    else {
                        
                        completion([])
                    }
                case .failure(let error):
                    print(error)
                    completion([])
                }
                
            }
    }
    
    internal func getWeathersByJSON(json : JSON) -> NSArray {
        let weathers = NSMutableArray()
        for (_,subjson):(String, JSON) in json["list"] {
            if (subjson["name"].stringValue=="") {
                continue
            }
            else {
                let weather = Weather(name: subjson["name"].stringValue, temp: subjson["main"]["temp"].stringValue, main: subjson["weather"][0]["main"].stringValue, description: subjson["weather"][0]["description"].stringValue, temp_min: subjson["main"]["temp_min"].stringValue, temp_max: subjson["main"]["temp_max"].stringValue, humidity: subjson["main"]["humidity"].stringValue, pressure: subjson["main"]["pressure"].stringValue, wind: subjson["wind"]["speed"].stringValue)

                weathers.add(weather)
            }
        }
        return weathers
    }
}
