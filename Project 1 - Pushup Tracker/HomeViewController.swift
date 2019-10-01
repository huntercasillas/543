//
//  HomeViewController.swift
//  Pushups
//
//  Created by Hunter Casillas on 9/26/19.
//  Copyright © 2019 Hunter Casillas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restoreDefaults()
        setPushupList()
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        underlineLabel.lineBreakMode = .byClipping
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    static var totalPushups = 0
    static var pushupList = [SavedPushup]()
    static var allPushups = [Int]()
    static var allDates = [Date]()
    @IBOutlet weak var totalPushupsLabel: UILabel!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var underlineLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // Set data any time view appears
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    // Get data from user defaults
    func restoreDefaults() {
        let defaults = UserDefaults.standard
        if let pushupDetails = defaults.array(forKey: "pushups") as? [Int] {
            HomeViewController.allPushups = pushupDetails
        }
        if let dateDetails = defaults.array(forKey: "dates") as? [Date] {
            HomeViewController.allDates = dateDetails
        }
        defaults.synchronize()
    }

    // Reload pushup entries with proper data
    func reloadData() {
        HomeViewController.pushupList.sort(by: { $0.date.compare($1.date) == .orderedDescending})
        HomeViewController.totalPushups = 0
        for pushup in HomeViewController.pushupList {
            HomeViewController.totalPushups += pushup.pushups
        }
        totalPushupsLabel.text = "Total Completed: \(HomeViewController.totalPushups)"
        tableView.reloadData()
    }
    
    // Save user defaults
      func saveDefaults() {
          let defaults = UserDefaults.standard
          defaults.set(HomeViewController.allPushups, forKey: "pushups")
          defaults.set(HomeViewController.allDates, forKey: "dates")
          defaults.synchronize()
      }
    
    // Delete from user defaults
    func deleteDefaults() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "pushups")
        defaults.removeObject(forKey: "dates")
        defaults.synchronize()
        HomeViewController.allPushups.removeAll()
        HomeViewController.allDates.removeAll()
        for pushup in HomeViewController.pushupList {
            HomeViewController.allPushups.append(pushup.pushups)
            HomeViewController.allDates.append(pushup.date)
        }
    }
    
    // Set pushup list from user defaults
    func setPushupList() {
        HomeViewController.pushupList.removeAll()
        for (pushup, date) in zip(HomeViewController.allPushups, HomeViewController.allDates) {
            let currentPushup = SavedPushup(pushups: pushup, date: date)
            HomeViewController.pushupList.append(currentPushup)
        }
    }
    
    // Display information pop up
    @IBAction func infoAction(_ sender: Any) {
        let infoMessage = UIAlertController(title: "You can delete any pushup entry by swiping left on it.", message: nil, preferredStyle: .alert)
        infoMessage.view.tintColor = TabViewController.tintColor
        infoMessage.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
        }))
        present(infoMessage, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            HomeViewController.pushupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            deleteDefaults()
            saveDefaults()
            reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeViewController.pushupList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pushup = HomeViewController.pushupList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PushupCell") as! PushupCell
        
        cell.setPost(pushup: pushup)
        cell.selectionStyle = .none
        return cell
    }
    
    // Change status bar text color to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
