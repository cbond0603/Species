//
//  StartViewController.swift
//  Species
//
//  Created by Chris Bond on 4/19/22.
//

import UIKit
import AVFoundation

class StartViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSound(name: "star-wars-intro")
        let originalY = imageView.frame.origin.y
        
        imageView.frame.origin.y = self.view.frame.height
        UIView.animate(withDuration: 4.0) {
            self.imageView.frame.origin.y = originalY
        }


    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ShowTableView", sender: sender)
        
    }
    
    func playSound(name: String){

        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: \(error.localizedDescription) could not read")
            }
        } else {
            print("Error could not read")
        }
    }

}
