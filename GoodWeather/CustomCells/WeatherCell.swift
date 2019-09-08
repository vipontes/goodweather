//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Vinicius Pontes on 07/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    func configure(_ vm: WeatherViewModel) {
        
        self.cityNameLabel?.text = vm.name.value
        self.temperatureLabel?.text = vm.currentTemperature.temperature.value.formatAsDegree
    }
}
