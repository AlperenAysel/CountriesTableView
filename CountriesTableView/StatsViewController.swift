//
//  StatsViewController.swift
//  CountriesTableView
//
//  Created by Alperen Aysel on 22.12.2019.
//  Copyright © 2019 Alperen Aysel. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var region: UILabel!
    
    @IBOutlet weak var subregion: UILabel!
    
    @IBOutlet weak var capital: UILabel!
    
    @IBOutlet weak var population: UILabel!
    
    
    var currCountry: Country?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = "Name: " + currCountry!.name
        region.text = "Region: " + currCountry!.region
        subregion.text = "Subregion: " + currCountry!.subregion
        capital.text = "Capital: " + currCountry!.capital
        population.text = "Population: " + String(currCountry!.population)
        
    }
    



}
