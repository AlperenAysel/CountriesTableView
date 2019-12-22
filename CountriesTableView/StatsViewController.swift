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
    
    @IBAction func postStats(_ sender: Any) {
                
        do {
           let url = URL(string: "http://89a66608.ngrok.io/saveCountryInfo")!
            var request = URLRequest(url: url)

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = try JSONEncoder().encode(currCountry!)
            
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                // check for fundamental networking error
                print("fundamental networking error=\(error)")
                return
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                }

                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString)")
            }
            dataTask.resume()
            
            
            
            
        } catch {
            print(error.localizedDescription)
        }

        

       
        
    }
    


}
