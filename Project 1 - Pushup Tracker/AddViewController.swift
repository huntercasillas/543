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
    }
    
    var currentPushups = 0
    var currentDate: Date = Date()
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pushupField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet var toolBar: UIToolbar!

    // Save user defaults
    func saveDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(HomeViewController.allPushups, forKey: "pushups")
        defaults.set(HomeViewController.allDates, forKey: "dates")
        defaults.synchronize()
    }
    
    // Change status bar text color to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Dismiss keyboard
    @IBAction func doneButton(_ sender: Any) {
        pushupField.resignFirstResponder()
    }
    
    // Update selected date
    @IBAction func dateSelection(_ sender: Any) {
        currentDate = datePicker.date
    }
    
    // Save pushup entry and add to tableview on home controller
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
            HomeViewController.allPushups.append(currentPushups)
            HomeViewController.allDates.append(currentDate)
            saveDefaults()
            pushupField.resignFirstResponder()
            pushupField.text = ""
            if tabBarController != nil {
                tabBarController!.selectedIndex = 0
            }
        }
    }
    
    // Add custom tool bar to keyboard when user clicks textfield
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = toolBar
        return true
    }
}
