//
//  AddViewController.swift
//  Pushups
//
//  Created by Hunter Casillas on 9/26/19.
//  Copyright © 2019 Hunter Casillas. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UIToolbarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        toolBar.delegate = self
        pushupField.delegate = self
        datePicker.setValue(TabViewController.tintColor, forKeyPath: "textColor")
        datePicker.setValue(false, forKeyPath: "highlightsToday")
        addButton.layer.borderWidth = 3
        addButton.layer.masksToBounds = false
        addButton.layer.borderColor = TabViewController.textColor.cgColor
        addButton.layer.cornerRadius = (addButton.frame.height/2)
        addButton.clipsToBounds = true
    }
    
    var currentPushups = 0
    var currentDate: Date = Date()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = toolBar
        return true
    }
    
    @IBAction func dateSelection(_ sender: Any) {
        currentDate = datePicker.date
    }
    
    @IBOutlet weak var pushupField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addAction(_ sender: Any) {
        if pushupField.text?.isEmpty ?? true {
            view.endEditing(true)
            let errorMessage = UIAlertController(title: "Please be sure to fill in how many pushups you did.", message: nil, preferredStyle: .alert)
            errorMessage.view.tintColor = TabViewController.tintColor
            errorMessage.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (action) in
                self.pushupField.becomeFirstResponder()
            }))
            present(errorMessage, animated: true, completion: nil)
            
        } else {
            currentPushups = Int(pushupField.text ?? "0") ?? 0
            let savedPushup = SavedPushup(pushups: currentPushups, date: currentDate)
            HomeViewController.pushupList.append(savedPushup)
            pushupField.resignFirstResponder()
            pushupField.text = ""
            if tabBarController != nil {
                tabBarController!.selectedIndex = 0
            }
        }
    }
    @IBAction func doneButton(_ sender: Any) {
        pushupField.resignFirstResponder()
    }
    @IBOutlet var toolBar: UIToolbar!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
}
