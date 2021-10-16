//
//  ViewController.swift
//  NumberGuesserApp
//
//  Created by Paweł Brzozowski on 16/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var range: Int = 2
    var lives: Int = 1
    var hints = true

    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var rangeDescriptionLabel: UILabel!
    
    @IBOutlet weak var numberOfLives: UILabel!
    @IBOutlet weak var numberOfLivesDescriptionLabel: UILabel!
    
    @IBOutlet weak var hintsLabel: UILabel!
    @IBOutlet weak var hintsDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rangeStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func livesStepper(_ sender: UIStepper) {
        if sender.value > 1 {
            if sender.value < 5 {
                numberOfLivesDescriptionLabel.text = "Choose the number of lives."
                numberOfLives.text = "\(Int(sender.value).description) ♥️"
                lives = Int(sender.value)
            }
            else {
                numberOfLivesDescriptionLabel.text = "Thats max. number ❤️‍🔥"
                numberOfLives.text = "\(Int(sender.value).description) ♥️"
                lives = Int(sender.value)
            }
        }
        else {
            numberOfLivesDescriptionLabel.text = "It cannot be lower 💔"
            numberOfLives.text = "\(Int(sender.value).description) ♥️"
            lives = Int(sender.value)
        }
    }
    
    @IBAction func hintSwitch(_ sender: UISwitch) {
    }
    
    
}

