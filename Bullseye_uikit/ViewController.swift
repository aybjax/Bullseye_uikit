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
    
    var currentValue: Int = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Methods
    // =======

    @IBAction func showAlert() {
        let msg = "The value of the slider is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello world",
                                      message: msg,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
}

