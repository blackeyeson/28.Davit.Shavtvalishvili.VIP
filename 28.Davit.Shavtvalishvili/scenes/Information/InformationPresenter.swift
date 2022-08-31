//
//  InformationPresenter.swift
//  28.Davit.Shavtvalishvili
//
//  Created by a on 30.08.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol InformationPresentationLogic {
    func presentSelectedCountry(response: CountryDetails.ShowCountryDetails.Response)
    func presentWeather(response: CountryDetails.GetWeather.Response)
}

final class InformationPresenter {
    // MARK: - Clean Components
    
    weak var viewController: InformationDisplayLogic?
}

// MARK: - CountryDetailsPresentationLogic

extension InformationPresenter: InformationPresentationLogic {
    
    func presentWeather(response: CountryDetails.GetWeather.Response) {
        let weather = response.data.main
        print(weather)
        var temperature = "Peak Temp: \(weather.temp_max) F Current Temp: \(weather.temp) F Minimum Temp: \(weather.temp_min) F"
        if weather.temp_min == weather.temp_min { temperature = "Current Temperature: \(weather.temp) F"}
        let humidity = "Humidity: \(weather.humidity)"
        viewController?.displayWeather(viewModel: CountryDetails.ShowCountryWeather.ViewModel(temp: temperature, humidity: humidity))
    }
    
    func presentSelectedCountry(response: CountryDetails.ShowCountryDetails.Response) {
        let countryName = response.country.name ?? "No Name"
        let latlng = response.country.latlng
        let lat = latlng[0]
        let lng = latlng[1]
        let coordsString = "\(lat) \(lng)"
        let capital = "Country: \(countryName) Capital: \(response.country.capital ?? "error@30") Coords: \(coordsString)"
        
        viewController?.displaySelectedCountry(viewModel: CountryDetails.ShowCountryDetails.ViewModel(capital: capital))
    }
}
