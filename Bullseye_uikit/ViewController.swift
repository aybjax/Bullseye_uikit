//
//  ViewController.swift
//  Bullseye_uikit
//
//  Created by aybjax on 5/29/21.
//

import UIKit

class ViewController: UIViewController {
    // Properties
    // ==========
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round = 0
    
    // Outlets
    // =======
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
//        updateTotalScoreLable()
    }
    
    // Methods
    // =======
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabel()
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    // Actions

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let msg = "You scored \(points)"
        
        let alert = UIAlertController(title: "Hello world",
                                      message: msg,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
}

