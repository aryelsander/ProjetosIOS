//
//  ViewController.swift
//  Project2
//
//  Created by ARYEL SANDER DOS SANTOS on 10/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var answerCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }

    func askQuestion(action:UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in :0...2)
        button1.setImage(UIImage(named: countries[0]), for:.normal)
        button2.setImage(UIImage(named: countries[1]), for:.normal)
        button3.setImage(UIImage(named: countries[2]), for:.normal)
        title = countries[correctAnswer].uppercased() + " | Score: \(score)"
    }
    
    func finishQuestions(action:UIAlertAction! = nil){
            
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else{
            title = "Wrong, this is the flag of \(countries[sender.tag])"
            score -= 1
        }
        answerCount += 1
        
        if(answerCount < 10){
            
            let ac = UIAlertController(title:title,message:"", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }else{
            
            let ac = UIAlertController(title:title,message:"Your final score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Finish", style: .default, handler: finishQuestions))
            present(ac, animated: true)
        }
    }
}

