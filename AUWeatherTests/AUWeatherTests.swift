//
//  AUWeatherTests.swift
//  AUWeatherTests
//
//  Created by Xiaoqian Yang on 20/2/17.
//  Copyright © 2017 XiaoqianYang. All rights reserved.
//

import XCTest
@testable import AUWeather
import SwiftyJSON


class WeatherServiceTests: XCTestCase {
    let weatherService = WeatherService.shared
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testGetWeathersByJSONWithOneCity() {
        let jsonString = "{\"cnt\":1,\"list\":[{\"coord\":{\"lon\":-80.61,\"lat\":28.08},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0056,\"country\":\"US\",\"sunrise\":1487678073,\"sunset\":1487719067},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"main\":{\"temp\":22.15,\"pressure\":1033.7,\"humidity\":94,\"temp_min\":22.15,\"temp_max\":22.15,\"sea_level\":1033.85,\"grnd_level\":1033.7},\"wind\":{\"speed\":3.21,\"deg\":67.5005},\"clouds\":{\"all\":0},\"dt\":1487640497,\"id\":4163971,\"name\":\"Melbourne\"}]}"
        let json = JSON.init(parseJSON: jsonString)
        
        let weathers = weatherService.getWeathersByJSON(json: json) as! [Weather]
        
        XCTAssert(weathers.count == 1)
        XCTAssert(weathers[0].name == "Melbourne" )
        XCTAssert(weathers[0].temp == "22.15" )
        XCTAssert(weathers[0].description == "clear sky" )
        XCTAssert(weathers[0].humidity == "94" )
        XCTAssert(weathers[0].main == "Clear" )
        XCTAssert(weathers[0].pressure == "1033.7" )
        XCTAssert(weathers[0].temp_max == "22.15" )
        XCTAssert(weathers[0].temp_min == "22.15" )
    }
    
    func testGetWeathersByJSONWithThreeCities() {
        let jsonString = "{\"cnt\":3,\"list\":[{\"coord\":{\"lon\":-80.61,\"lat\":28.08},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0058,\"country\":\"US\",\"sunrise\":1487678073,\"sunset\":1487719067},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"main\":{\"temp\":21.6,\"pressure\":1033.89,\"humidity\":97,\"temp_min\":21.6,\"temp_max\":21.6,\"sea_level\":1034.05,\"grnd_level\":1033.89},\"wind\":{\"speed\":3.11,\"deg\":74.5008},\"clouds\":{\"all\":0},\"dt\":1487640931,\"id\":4163971,\"name\":\"Melbourne\"},{\"coord\":{\"lon\":151.21,\"lat\":-33.87},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0048,\"country\":\"AU\",\"sunrise\":1487619348,\"sunset\":1487666472},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"main\":{\"temp\":24.85,\"pressure\":1026.27,\"humidity\":59,\"temp_min\":24.85,\"temp_max\":24.85,\"sea_level\":1032.43,\"grnd_level\":1026.27},\"wind\":{\"speed\":1.21,\"deg\":82.5008},\"clouds\":{\"all\":0},\"dt\":1487640931,\"id\":2147714,\"name\":\"Sydney\"},{\"coord\":{\"lon\":153.03,\"lat\":-27.47},\"sys\":{\"type\":0,\"id\":0,\"message\":0.1085,\"country\":\"AU\",\"sunrise\":1487619320,\"sunset\":1487665634},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"02d\"}],\"main\":{\"temp\":28.35,\"pressure\":1017.03,\"humidity\":64,\"temp_min\":28.35,\"temp_max\":28.35,\"sea_level\":1029.27,\"grnd_level\":1017.03},\"wind\":{\"speed\":4.56,\"deg\":109.501},\"clouds\":{\"all\":8},\"dt\":1487640931,\"id\":2174003,\"name\":\"Brisbane\"}]}"
        let json = JSON.init(parseJSON: jsonString)
        
        let weathers = weatherService.getWeathersByJSON(json: json) as! [Weather]
        
        XCTAssert(weathers.count == 3)
        XCTAssert(weathers[0].name == "Melbourne" )
        XCTAssert(weathers[0].temp == "21.6" )
        XCTAssert(weathers[0].description == "clear sky" )
        XCTAssert(weathers[0].humidity == "97" )
        XCTAssert(weathers[0].main == "Clear" )
        XCTAssert(weathers[0].pressure == "1033.89" )
        XCTAssert(weathers[0].temp_max == "21.6" )
        XCTAssert(weathers[0].temp_min == "21.6" )

        XCTAssert(weathers[1].name == "Sydney" )
        XCTAssert(weathers[1].temp == "24.85" )
        XCTAssert(weathers[1].description == "clear sky" )
        XCTAssert(weathers[1].humidity == "59" )
        XCTAssert(weathers[1].main == "Clear" )
        XCTAssert(weathers[1].pressure == "1026.27" )
        XCTAssert(weathers[1].temp_max == "24.85" )
        XCTAssert(weathers[1].temp_min == "24.85" )

        XCTAssert(weathers[2].name == "Brisbane" )
        XCTAssert(weathers[2].temp == "28.35" )
        XCTAssert(weathers[2].description == "clear sky" )
        XCTAssert(weathers[2].humidity == "64" )
        XCTAssert(weathers[2].main == "Clear" )
        XCTAssert(weathers[2].pressure == "1017.03" )
        XCTAssert(weathers[2].temp_max == "28.35" )
        XCTAssert(weathers[2].temp_min == "28.35" )

    }
    
    func testGetWeathersByJSONWithOneCityWrongJSON() {
        let jsonString = "{\"cnt\":1,\"tt\":[{\"coord\":{\"lon\":-80.61,\"lat\":28.08},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0056,\"country\":\"US\",\"sunrise\":1487678073,\"sunset\":1487719067},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"main\":{\"temp\":22.15,\"pressure\":1033.7,\"humidity\":94,\"temp_min\":22.15,\"temp_max\":22.15,\"sea_level\":1033.85,\"grnd_level\":1033.7},\"wind\":{\"speed\":3.21,\"deg\":67.5005},\"clouds\":{\"all\":0},\"dt\":1487640497,\"id\":4163971,\"name\":\"Melbourne\"}]}"
        let json = JSON.init(parseJSON: jsonString)
        
        let weathers = weatherService.getWeathersByJSON(json: json) as! [Weather]
        
        XCTAssert(weathers.count == 0)
    }

    func testGetWeathersByJSONWithOneCityWrongName() {
        let jsonString = "{\"cnt\":1,\"list\":[{\"coord\":{\"lon\":-80.61,\"lat\":28.08},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0056,\"country\":\"US\",\"sunrise\":1487678073,\"sunset\":1487719067},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"main\":{\"tempp\":22.15,\"pressure\":1033.7,\"humidity\":94,\"temp_min\":22.15,\"temp_max\":22.15,\"sea_level\":1033.85,\"grnd_level\":1033.7},\"wind\":{\"speed\":3.21,\"deg\":67.5005},\"clouds\":{\"all\":0},\"dt\":1487640497,\"id\":4163971,\"names\":\"Melbourne\"}]}"
        let json = JSON.init(parseJSON: jsonString)
        
        let weathers = weatherService.getWeathersByJSON(json: json) as! [Weather]
        
        XCTAssert(weathers.count == 0)
    }
    
    func testGetWeathersByJSONWithOneCityWrongAttr() {
        let jsonString = "{\"cnt\":1,\"list\":[{\"coord\":{\"lon\":-80.61,\"lat\":28.08},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0056,\"country\":\"US\",\"sunrise\":1487678073,\"sunset\":1487719067},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"main\":{\"tempp\":22.15,\"pressuree\":1033.7,\"humidity\":94,\"temp_min\":22.15,\"temp_max\":22.15,\"sea_level\":1033.85,\"grnd_level\":1033.7},\"wind\":{\"speed\":3.21,\"deg\":67.5005},\"clouds\":{\"all\":0},\"dt\":1487640497,\"id\":4163971,\"name\":\"Melbourne\"}]}"
        let json = JSON.init(parseJSON: jsonString)
        
        let weathers = weatherService.getWeathersByJSON(json: json) as! [Weather]
        
        XCTAssert(weathers.count == 1)
        XCTAssert(weathers[0].name == "Melbourne" )
        XCTAssert(weathers[0].temp == "" )
        XCTAssert(weathers[0].description == "clear sky" )
        XCTAssert(weathers[0].humidity == "94" )
        XCTAssert(weathers[0].main == "Clear" )
        XCTAssert(weathers[0].pressure == "" )
        XCTAssert(weathers[0].temp_max == "22.15" )
        XCTAssert(weathers[0].temp_min == "22.15" )
    }

    func testGetWeathersByJSONWithThreeCitiesWrongCity() {
        let jsonString = "{\"cnt\":3,\"list\":[{\"coord\":{\"lon\":-80.61,\"lat\":28.08},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0058,\"country\":\"US\",\"sunrise\":1487678073,\"sunset\":1487719067},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"main\":{\"temp\":21.6,\"pressure\":1033.89,\"humidity\":97,\"temp_min\":21.6,\"temp_max\":21.6,\"sea_level\":1034.05,\"grnd_level\":1033.89},\"wind\":{\"speed\":3.11,\"deg\":74.5008},\"clouds\":{\"all\":0},\"dt\":1487640931,\"id\":4163971,\"name\":\"Melbourne\"},{\"coord\":{\"lon\":151.21,\"lat\":-33.87},\"sys\":{\"type\":0,\"id\":0,\"message\":0.0048,\"country\":\"AU\",\"sunrise\":1487619348,\"sunset\":1487666472},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"main\":{\"temp\":24.85,\"pressure\":1026.27,\"humidity\":59,\"temp_min\":24.85,\"temp_max\":24.85,\"sea_level\":1032.43,\"grnd_level\":1026.27},\"wind\":{\"speed\":1.21,\"deg\":82.5008},\"clouds\":{\"all\":0},\"dt\":1487640931,\"id\":2147714,\"name\":\"\"},{\"coord\":{\"lon\":153.03,\"lat\":-27.47},\"sys\":{\"type\":0,\"id\":0,\"message\":0.1085,\"country\":\"AU\",\"sunrise\":1487619320,\"sunset\":1487665634},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"02d\"}],\"main\":{\"temp\":28.35,\"pressure\":1017.03,\"humidity\":64,\"temp_min\":28.35,\"temp_max\":28.35,\"sea_level\":1029.27,\"grnd_level\":1017.03},\"wind\":{\"speed\":4.56,\"deg\":109.501},\"clouds\":{\"all\":8},\"dt\":1487640931,\"id\":2174003,\"name\":\"Brisbane\"}]}"
        let json = JSON.init(parseJSON: jsonString)
        
        let weathers = weatherService.getWeathersByJSON(json: json) as! [Weather]
        
        XCTAssert(weathers.count == 2)
        XCTAssert(weathers[0].name == "Melbourne" )
        XCTAssert(weathers[0].temp == "21.6" )
        XCTAssert(weathers[0].description == "clear sky" )
        XCTAssert(weathers[0].humidity == "97" )
        XCTAssert(weathers[0].main == "Clear" )
        XCTAssert(weathers[0].pressure == "1033.89" )
        XCTAssert(weathers[0].temp_max == "21.6" )
        XCTAssert(weathers[0].temp_min == "21.6" )
        
        XCTAssert(weathers[1].name == "Brisbane" )
        XCTAssert(weathers[1].temp == "28.35" )
        XCTAssert(weathers[1].description == "clear sky" )
        XCTAssert(weathers[1].humidity == "64" )
        XCTAssert(weathers[1].main == "Clear" )
        XCTAssert(weathers[1].pressure == "1017.03" )
        XCTAssert(weathers[1].temp_max == "28.35" )
        XCTAssert(weathers[1].temp_min == "28.35" )
        
    }

    func testGetWeatherByCityIdsWith3ID() {
        let cities = ["4163971","2147714","2174003"];
        
        weatherService.getWeatherByCityIds(city: cities as NSArray) {
            (weather : NSArray) in
            let weathers = weather as! [Weather]
            XCTAssert(weathers.count == 3)
            XCTAssert(weathers[0].name.lowercased() == "melbourne")
            XCTAssert(weathers[1].name.lowercased() == "sydney")
            XCTAssert(weathers[2].name.lowercased() == "brisbane")
        }

    }
    
    func testGetWeatherByCityIdsWithOneID() {
        let cities = ["4163971"];
        
        weatherService.getWeatherByCityIds(city: cities as NSArray) {
            (weather : NSArray) in
            let weathers = weather as! [Weather]
            XCTAssert(weathers.count == 1)
            XCTAssert(weathers[0].name.lowercased() == "melbourne")
        }
        
    }
    
    func testGetWeatherByCityIdsWith3IDOneWrong() {
        let cities = ["4163971","","2174003"];
        
        weatherService.getWeatherByCityIds(city: cities as NSArray) {
            (weather : NSArray) in
            let weathers = weather as! [Weather]
            XCTAssert(weathers.count == 2)
            XCTAssert(weathers[0].name.lowercased() == "melbourne")
            XCTAssert(weathers[0].name.lowercased() == "brisbane")
        }
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
