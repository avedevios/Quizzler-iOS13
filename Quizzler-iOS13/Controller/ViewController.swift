//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questBrain = QuestBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        let isUserGotItCorrect = questBrain.isAnswerRight(sender.currentTitle!)
        
        if isUserGotItCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        questBrain.changeQuestion()
    }
    
    @objc func updateUI() {
        questionLabel.text = questBrain.getQuestionText()
        
        progressBar.progress = questBrain.getProgress()
        scoreLabel.text = "Score: \(questBrain.getScore())"
        
        firstButton.setTitle(questBrain.getAnswerText(0), for: UIControl.State.normal)
        firstButton.backgroundColor = UIColor.clear
        
        secondButton.setTitle(questBrain.getAnswerText(1), for: UIControl.State.normal)
        secondButton.backgroundColor = UIColor.clear
        
        thirdButton.setTitle(questBrain.getAnswerText(2), for: UIControl.State.normal)
        thirdButton.backgroundColor = UIColor.clear

    }
}

