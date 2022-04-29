//
//  DetailViewController.swift
//  Species
//
//  Created by Chris Bond on 4/19/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesImage: UIImageView!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var lifeSpanLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var speciesData: SpeciesData!
    var speciesDetail = SpeciesDetail()
    
//    var urlString = "\()"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabels()
        if speciesData == nil {
            speciesData = SpeciesData(name: "", url: "")
        }
        
        nameLabel.text = speciesData.name
        speciesDetail.urlString = speciesData.url
        speciesDetail.getData {
            DispatchQueue.main.async {
                self.updateUserInterface()
            }
        }
        
    }
    
    func clearLabels() {
        classificationLabel.text = ""
    designationLabel.text = ""
    languageLabel.text = ""
    lifeSpanLabel.text = ""
    heightLabel.text = ""
    skinColorLabel.text = ""
    hairColorLabel.text = ""
    eyeColorLabel.text = ""
        
    
    }
    
    func updateUserInterface() {
        classificationLabel.text = speciesDetail.classification
        designationLabel.text = speciesDetail.designation
        languageLabel.text = speciesDetail.language
        lifeSpanLabel.text = speciesDetail.lifespan
        heightLabel.text = speciesDetail.height
        skinColorLabel.text = speciesDetail.skinColor
        hairColorLabel.text = speciesDetail.hairColor
        eyeColorLabel.text = speciesDetail.eyeColor
        
        imageView.image = UIImage(named: speciesData.name)
        
    }
    

}
