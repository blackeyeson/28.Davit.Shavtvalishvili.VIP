//
//  CountryCellModel.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 29.08.22.
//

import Foundation

final class CountryCellModel: AbstractModel {
    let title: String
    let capital: String
    let latlng: [Double]

    init(title: String, capital: String, latlng: [Double]) {
        self.title = title
        self.capital = capital
        self.latlng = latlng
    }
}
