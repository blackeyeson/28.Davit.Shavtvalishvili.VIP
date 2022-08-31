//
//  Country.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import Foundation

struct Country: Decodable {
    let name: String?
    let capital: String?
    let population: Int?
    let latlng: [Double]
}

struct Weather: Decodable {
    
    let coord: Coords
    let main: Main
    
    struct Coords: Decodable {
        let lon: Double
        let lat: Double
    }
    
    struct Main: Decodable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
        let humidity: Int
    }
}
