//
//  TableConfigurator.swift
//  28.Davit.Shavtvalishvili
//
//  Created by a on 30.08.22.
//

import Foundation

enum TableConfigurator {
    static func configure() -> TableViewController {
        let apiManager = APIManager()
        let worker = TableWorker(apiManager: apiManager)
        let presenter = TablePresenter()
        let interactor = TableInteractor(presenter: presenter, worker: worker)
        let router = TableRouter(dataStore: interactor)
        let viewController = TableViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
