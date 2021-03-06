//
//  ViewController.swift
//  NumberGuesserApp
//
//  Created by PaweÅ Brzozowski on 16/10/2021.
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
        if sender.value > 2 {
            if sender.value < 100 {
                rangeDescriptionLabel.text = "Choose a range of numbers."
                rangeLabel.text = "0 - \(Int(sender.value).description)"
                range = Int(sender.value)
            }
            else {
                rangeDescriptionLabel.text = "Thats max. number ð³"
                rangeLabel.text = "0 - \(Int(sender.value).description)"
                range = Int(sender.value)
            }
        }
        else {
            rangeDescriptionLabel.text = "It cannot be lower ð¢"
        }
    }
    
    @IBAction func livesStepper(_ sender: UIStepper) {
        if sender.value > 1 {
            if sender.value < 5 {
                numberOfLivesDescriptionLabel.text = "Choose the number of lives."
                numberOfLives.text = "\(Int(sender.value).description) â¥ï¸"
                lives = Int(sender.value)
            }
            else {
                numberOfLivesDescriptionLabel.text = "Thats max. number â¤ï¸âð¥"
                numberOfLives.text = "\(Int(sender.value).description) â¥ï¸"
                lives = Int(sender.value)
            }
        }
        else {
            numberOfLivesDescriptionLabel.text = "It cannot be lower ð"
            numberOfLives.text = "\(Int(sender.value).description) â¥ï¸"
            lives = Int(sender.value)
        }
    }
    
    @IBAction func hintSwitch(_ sender: UISwitch) {
        if sender.isOn {
            hintsLabel.text = "Yes âºï¸"
            hints = true
        } else {
            hintsLabel.text = "No ð¢"
            hints = false
        }
    }
    
    var dataToSend = [String:Any]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! GameViewController
        destination.receivedData = sender as! [String:Any]
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        dataToSend = [
            "range":range,
            "lives":lives,
            "hints":hints
        ]
        performSegue(withIdentifier: "segueToGame", sender: dataToSend)
    }
    
}

