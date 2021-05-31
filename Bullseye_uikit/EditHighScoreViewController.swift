//
//  EditHighScoreViewController.swift
//  Bullseye_uikit
//
//  Created by aybjax on 5/31/21.
//

import UIKit

protocol EditHighScoreViewControllerDelegate: class {
    func editHighScoreVIewControllerDidCancel(
        _ controller: EditHighScoreViewController)
    
    func editHighScoreViewController(
        _ controller: EditHighScoreViewController,
        didFinishEditing item: HighScoreItem)
}

class EditHighScoreViewController: UITableViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.text = highScoreItem.name
        textField.becomeFirstResponder()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // MARK: - Table view Delegates
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath)
    ->IndexPath? {
        return nil
    }

    // MARK: - Actions
    
    @IBAction
    func cancel() {
        delegate?.editHighScoreVIewControllerDidCancel(self)
    }
    
    @IBAction
    func done() {
        highScoreItem.name = textField.text!
        delegate?.editHighScoreViewController(self, didFinishEditing: highScoreItem)
    }
    
    // MARK: - Outlets
    
    @IBOutlet
    weak var textField: UITextField!
    
    @IBOutlet
    weak var doneBarButton: UIBarButtonItem!
    
    // MARK: - Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        }
        else {
            doneBarButton.isEnabled = true
        }
        
        return true
    }
    
    // Delegate properties
    // ===================
    weak var delegate: EditHighScoreViewControllerDelegate?
    var highScoreItem: HighScoreItem!
}
