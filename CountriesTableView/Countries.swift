//
//  Countries.swift
//  CountriesTableView
//
//  Created by Alperen Aysel on 22.12.2019.
//  Copyright © 2019 Alperen Aysel. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
    let subregion: String
    let population: Int
}
