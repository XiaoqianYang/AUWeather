//
//  DetailViewController.swift
//  AUWeather
//
//  Created by Xiaoqian Yang on 20/2/17.
//  Copyright © 2017 XiaoqianYang. All rights reserved.
//

import UIKit
import Spring

class DetailViewController: UIViewController {

    @IBOutlet var iconView: SpringImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet var windLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            self.title = detail.name
            //self.view.backgroundColor = UIColor(patternImage: UIImage.init(named:"blue")!)
            if let imageView = self.iconView {
                if (detail.main.lowercased() == "clear") {
                    imageView.image = UIImage.init(named:"clear")
                }
                else if (detail.main.lowercased() == "rain") {
                    imageView.image = UIImage.init(named:"rainning")
                }
                else {
                    imageView.image = UIImage.init(named:"cloud")
                }
            }
            
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
            if let label = self.tempLabel {
                label.text = "Main : \(detail.temp) \u{00B0}C"
            }
            if let label = self.windLabel {
                label.text = "Wind : \(detail.wind) m/s"
            }
            if let label = self.humidityLabel {
                label.text = "Humidity : \(detail.humidity) %"
            }
            if let label = self.pressureLabel {
                label.text = "Pressure : \(detail.pressure) hpa"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Weather? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

