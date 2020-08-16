//
//  ViewController.swift
//  swift100-project-2
//
//  Created by Michael West on 8/14/20.
//  Copyright © 2020 Michael West. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var questionsAsked = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        scoreLabel.text = ""
        
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()

    }

    func askQuestion(action: UIAlertAction! = nil) {
        if(questionsAsked != 0){
            scoreLabel.text = "\(score)/\(questionsAsked)"
        }
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        title = (countries[correctAnswer].uppercased())
        
        
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        questionsAsked += 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message : String

        if sender.tag == correctAnswer {
            title = "Correct"
            message = "Your score is now: "
            score += 1
        } else {
            title = "Wrong"
            message = "That is the flag of \(countries[sender.tag].uppercased()). Your score is now: "
        }
        
        if(questionsAsked == 10){
            title = "Final Score"
            message = "Your final score is: "
        }
        
        let ac = UIAlertController(title: title, message: "\(message) \(score)/\(questionsAsked)", preferredStyle: .alert)
        
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
    }
}

