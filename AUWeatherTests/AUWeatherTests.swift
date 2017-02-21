//
//  AUWeatherTests.swift
//  AUWeatherTests
//
//  Created by Xiaoqian Yang on 20/2/17.
//  Copyright © 2017 XiaoqianYang. All rights reserved.
//

import XCTest
@testable import AUWeather


class WeatherServiceTests: XCTestCase {
    let weatherService = WeatherService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetWeathersByJSON() {
        //let jsonString = "{\"coord\":{\"lon\":-80.61,\"lat\":28.08},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":293.647,\"pressure\":1033.22,\"humidity\":100,\"temp_min\":293.647,\"temp_max\":293.647,\"sea_level\":1033.24,\"grnd_level\":1033.22},\"wind\":{\"speed\":3.49,\"deg\":338.001},\"clouds\":{\"all\":0},\"dt\":1487575985,\"sys\":{\"message\":0.0077,\"country\":\"US\",\"sunrise\":1487591714,\"sunset\":1487632637},\"id\":4163971,\"name\":\"Melbourne\",\"cod\":200}"
        //let json = JSON.init(parseJSON: jsonString)
        
        //let weathers = weatherService.getWeathersByJSON(json: json)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
