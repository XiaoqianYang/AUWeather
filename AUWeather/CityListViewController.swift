//
//  CityListViewController.swift
//  AUWeather
//
//  Created by Xiaoqian Yang on 20/2/17.
//  Copyright © 2017 XiaoqianYang. All rights reserved.
//

import UIKit
import SwiftyJSON
import GradientCircularProgress

class CityListViewController: UITableViewController {

    private var detailViewController: DetailViewController? = nil
    private var objects = NSArray()
    private var weatherService = WeatherService.shared
    private let cities = ["4163971","2147714","2174003"];
    private let progress = GradientCircularProgress()
    


    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        self.weatherService.getWeatherByCityIds(city: cities as NSArray) {
            (weather : NSArray) in
            self.progress.dismiss()
            self.objects = weather
            self.tableView.reloadData()
        }
        self.progress.show(message: "Loading....", style: MyStyle())
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! Weather
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (objects.count == 0) {
            tableView.tableDisplayWithMessage(message: "No Data", rowCount: 0)
        }
        else {
            tableView.tableDisplayWithMessage(message: "", rowCount: objects.count)
        }
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let weather = objects[indexPath.row] as! Weather
        cell.textLabel!.text = weather.name
        cell.detailTextLabel!.text = weather.temp + "\u{00B0}C"
        return cell
    }

}

// MARK: - Table View Extension

extension UITableView {
    func tableDisplayWithMessage(message : String, rowCount: Int) {
        if (rowCount == 0) {
            let messageLabel = UILabel()
            messageLabel.text = message
            messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
            messageLabel.textColor = UIColor.lightGray
            messageLabel.textAlignment = .center
            messageLabel.sizeToFit()
            
            self.backgroundView = messageLabel
            self.separatorStyle = .none
        }
        else {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }
    }
}

