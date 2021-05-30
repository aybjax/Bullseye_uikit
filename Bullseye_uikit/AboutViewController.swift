//
//  AboutViewController.swift
//  Bullseye_uikit
//
//  Created by aybjax on 5/30/21.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    // Outlets
    // =======
    
    @IBOutlet
    weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = Bundle.main.url(forResource: "BullsEye",
                                    withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
