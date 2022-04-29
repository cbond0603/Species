//
//  SpeciesDetail.swift
//  Species
//
//  Created by Chris Bond on 4/19/22.
//

import Foundation

class SpeciesDetail{
    
    private struct Returned: Codable {
        var classification: String
        var designation: String
        var average_height: String
        var skin_colors: String
        var hair_colors: String
        var eye_colors: String
        var average_lifespan: String
        var language: String
    }
    
    var urlString = ""
    var classification = ""
    var designation = ""
    var skinColor = ""
    var hairColor = ""
    var eyeColor = ""
    var language = ""
    var height = ""
    var lifespan = ""
    
    
    
    func getData(completed: @escaping() -> ()) {
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
                self.classification = returned.classification
                self.designation = returned.designation
                self.height = returned.average_height
                self.lifespan = returned.average_lifespan
                self.skinColor = returned.skin_colors
                self.hairColor = returned.hair_colors
                self.eyeColor = returned.eye_colors
                self.language = returned.language
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
    
    func updateUserInterface() {

    }
}
