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
    var userWon: Bool = false
    
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
        feedbackLabel.text = "Are you feeling lucky today?"
        hintLabel.text = ""
    }

    @IBAction func chechButton(_ sender: UIButton) {
        if userWon == false {
            let userGuess = Int(textField.text!)
            print("Val. of rand_num = \(randomNumber)")
            
            if userGuess == randomNumber {
                mainLabel.text = "YOU WON 🏆"
                subtextLabel.text = "Congratulation for you"
                feedbackLabel.text = "Your answer is right 👍"
                feedbackLabel.textColor = .green
                hintLabel.text = ""
                userWon = true
                
                
            } else {
                lives = lives - 1
                if lives < 1 {
                    mainLabel.text = "GAME OVER 💩"
                    subtextLabel.text = "Try again, meybe next time"
                    setLivesLabel()
                } else {
                    setLivesLabel()
                    feedbackLabel.text = "Your answer is wrong 😢"
                    feedbackLabel.textColor = .red
                    displayHint(playerNumber: userGuess!, randNumber: randomNumber)
                }
            }
            textField.text = ""
        } else {
            textField.placeholder = "You have already won"
        }
        self.view.endEditing(true)
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
    
    func displayHint(playerNumber: Int, randNumber: Int) {
        if playerNumber > randNumber {
            hintLabel.text = "Try lower number"
        } else {
            hintLabel.text = "Try higher number"
        }
    }
    
}
