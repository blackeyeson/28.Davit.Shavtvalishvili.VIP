//
//  InformationInteractor.swift
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

protocol InformationBusinessLogic {
    func getCountry(request: CountryDetails.ShowCountryDetails.Request)
    func getWeather(request: CountryDetails.GetWeather.Request)
}

protocol InformationDataStore {
//    var weather: Weather? { get }
}

final class InformationInteractor: InformationDataStore {
    // MARK: - Clean Components
    
    private let presenter: InformationPresentationLogic
    private let worker: InformationWorkerLogic
    private let selectedCountry: Country
//    private(set) var weather: Weather? = nil
    
    // MARK: - Object Lifecycle
    
    init(presenter: InformationPresentationLogic, worker: InformationWorkerLogic, selectedCountry: Country) {
        self.presenter = presenter
        self.worker = worker
        self.selectedCountry = selectedCountry
    }
}

// MARK: - CountryDetailsBusinessLogic

extension InformationInteractor: InformationBusinessLogic {
    
    func getCountry(request: CountryDetails.ShowCountryDetails.Request) {
        presenter.presentSelectedCountry(response: CountryDetails.ShowCountryDetails.Response(country: selectedCountry))
    }
    
    func getWeather(request: CountryDetails.GetWeather.Request) {
        Task {
            do {
                let weather = try await worker.fetchWeather()
                DispatchQueue.main.async { [weak self] in
                    self?.presenter.presentWeather(response: CountryDetails.GetWeather.Response(data: weather))
                }
            } catch { print(error) }
        }
    }
}
