//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    var weatherViewModel: WeatherViewModel?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let weatherVM = self.weatherViewModel {
//            self.cityNameLabel.text = weatherVM.name.value
//            self.currentTemperatureLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
//            self.minTemperatureLabel.text = weatherVM.currentTemperature.temperatureMin.value.formatAsDegree
//            self.maxTemperatureLabel.text = weatherVM.currentTemperature.temperatureMax.value.formatAsDegree
//        }
        
        setupVMBindings()
    }
    
    func setupVMBindings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind { self.cityNameLabel.text = $0 }
            weatherVM.currentTemperature.temperature.bind { self.currentTemperatureLabel.text = $0.formatAsDegree }
            weatherVM.currentTemperature.temperatureMin.bind { self.minTemperatureLabel.text = $0.formatAsDegree }
            weatherVM.currentTemperature.temperatureMax.bind { self.maxTemperatureLabel.text = $0.formatAsDegree }
        }
    }
}
