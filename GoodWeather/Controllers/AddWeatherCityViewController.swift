//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Vinicius Pontes on 07/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind { self.addCityViewModel.city = $0 }
        }
    }

    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind { self.addCityViewModel.state = $0 }
        }
    }

    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }

    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPress () {
        
        if var city = cityNameTextField.text {
            
            city = city.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=e4c5930737e0491fdcd57b380567803f&units=metric")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl) { data in

                let weatherVM = try?JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    } else {
                        print(result!)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
