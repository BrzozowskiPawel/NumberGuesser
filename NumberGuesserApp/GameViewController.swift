//
//  GameViewController.swift
//  NumberGuesserApp
//
//  Created by Paweł Brzozowski on 17/10/2021.
//

import UIKit

class GameViewController: UIViewController {

    var receivedData = [String:Any]()
    
    var lives: Int = -1
    var range: Int = -1
    var hints: Bool = true
    var randomNumber: Int = -1
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subtextLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        range = receivedData["range"] as! Int
        lives = receivedData["lives"] as! Int
        hints = receivedData["hints"] as! Bool
        randomNumber = Int.random(in: 1...range)
        
        setLivesLabel()
        setRangeLabel()
    }

    func setLivesLabel() {
        if lives >= 1 {
            livesLabel.text = "\(lives)♥️"
        } else {
            livesLabel.text = "💔"
        }
    }
    
    func setHintsVisibility() {
        if hints == false{
            hintLabel.text = ""
        }
    }
    
    func setRangeLabel() {
        rangeLabel.text = "0-\(range)"
    }
}
