//
//  Species.swift
//  Species
//
//  Created by Chris Bond on 4/19/22.
//

import Foundation


class Species {
    
    private struct Returned: Codable {
        var count: Int
        var next: String?
        var results: [SpeciesData]
    }
    
    var numberOfSpecies = 0
    var speciesArray: [SpeciesData] = []
    var urlString = "https://swapi.dev/api/species/"
    var isFetching = false
    
    
    
    func getData(completed: @escaping() -> ()) {
        guard !isFetching else {return}
        isFetching = true
        
        print("We are accessing the url \(urlString)")
        guard let url = URL(string: urlString) else {
            print("ERROR: couldnt create a URL from \(urlString)")
            completed()
            return
        }
        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.speciesArray = self.speciesArray + returned.results
                self.numberOfSpecies = returned.count
                self.urlString = returned.next ?? ""

            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            self.isFetching =  false
            completed()
        }
        task.resume()
    }
    
    
}
