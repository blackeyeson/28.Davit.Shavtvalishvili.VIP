//
//  TableRouter.swift
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

protocol TableRoutingLogic {
    func navigateToCountryDetails()
}

protocol TableDataPassing {
    var dataStore: TableDataStore { get }
}

class TableRouter: NSObject, TableRoutingLogic, TableDataPassing {
    
    // MARK: - Clean Components
    
    weak var viewController: TableViewController?
    private(set) var dataStore: TableDataStore
    
    // MARK: - Object Lifecycle
    
    init(dataStore: TableDataStore) {
        self.dataStore = dataStore
    }
    
    // MARK: - Routing
    
    func navigateToCountryDetails() {
        guard let selectedCountry = dataStore.selectedCountry else { return }
        let destinationVC = InformationConfigurator.configure(with: selectedCountry)
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
