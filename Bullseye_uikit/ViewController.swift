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
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackRightResizable, for: .normal)
    }
    
    // Methods
    // =======
    
    func startNewRound() {
        // Animation
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
        
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
    
    func addHighScore(_ score: Int) {
        guard score > 0 else {
            return;
        }
        
        let high_score = HighScoreItem(name: "Unknown", score: score)
        
        var high_scores = PersistencyHelper.loadHighScores()
        high_scores.append(high_score)
        high_scores.sort{$0.score > $1.score}
        
        PersistencyHelper.saveHighScores(high_scores)
    }
    
    // Actions
    
    @IBAction
    func startNewGame() {
        addHighScore(score)
        
        score = 0
        round = 0
        startNewRound()
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let msg = "You scored \(points)"
        
        let alert = UIAlertController(title: "Bullseye",
                                      message: msg,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
}

