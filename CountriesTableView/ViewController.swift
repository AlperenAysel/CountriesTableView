//
//  ViewController.swift
//  CountriesTableView
//
//  Created by Alperen Aysel on 22.12.2019.
//  Copyright © 2019 Alperen Aysel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var countries = [Country]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadData {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toStatsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as? StatsViewController
        nextVC?.currCountry = countries[tableView.indexPathForSelectedRow!.row]
    }
    
    
    func downloadData(compilation: @escaping () -> ()) {
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObject = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
            
            
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data!)
         
                DispatchQueue.main.async {
                    compilation()
                }
            
            } catch {
                print("JSON ERROR")
            }
            
        }.resume()
        
    }
       
}

