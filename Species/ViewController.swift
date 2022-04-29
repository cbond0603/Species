//
//  ViewController.swift
//  Species
//
//  Created by Chris Bond on 4/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var species = Species()
    
//    var species = ["Hutt", "Ewok", "Wookie", "Droid", "Human"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        species.getData {
            DispatchQueue.main.async {
                self.navigationItem.title = "\(self.species.speciesArray.count) of \(self.species.numberOfSpecies) species loaded"
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.speciesData = species.speciesArray[selectedIndexPath.row]
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return species.speciesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row + 1 == species.speciesArray.count && species.urlString.hasPrefix("http") {
            species.getData {
                DispatchQueue.main.async {
                    self.navigationItem.title = "\(self.species.speciesArray.count) of \(self.species.numberOfSpecies) species loaded"
                    self.tableView.reloadData()
                }
            }
            
        }
        
        cell.textLabel?.text = species.speciesArray[indexPath.row].name
        return cell
    }
}
