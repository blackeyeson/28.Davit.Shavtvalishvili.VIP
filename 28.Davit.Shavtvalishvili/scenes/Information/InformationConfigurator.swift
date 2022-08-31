//
//  InformationConfigurator.swift
//  28.Davit.Shavtvalishvili
//
//  Created by a on 30.08.22.
//


import Foundation

enum InformationConfigurator {
    static func configure(with selectedCountry: Country) -> InformationViewController {
        let apiManager = APIManager()
        let worker = InformationWorker(apiManager: apiManager, lat: selectedCountry.latlng[0] , lon: selectedCountry.latlng[1])
        let presenter = InformationPresenter()
        let interactor = InformationInteractor(presenter: presenter, worker: worker, selectedCountry: selectedCountry)
        let router = InformationRouter(dataStore: interactor)
        let viewController = InformationViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
