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
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        underlineLabel.lineBreakMode = .byClipping
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func reloadData() {
        HomeViewController.pushupList.sort(by: { $0.date.compare($1.date) == .orderedDescending})
        HomeViewController.totalPushups = 0
        for pushup in HomeViewController.pushupList {
            HomeViewController.totalPushups += pushup.pushups
        }
        totalPushupsLabel.text = "Total Completed: \(HomeViewController.totalPushups)"
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            HomeViewController.pushupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            reloadData()
        }
    }
    
    static var totalPushups = 0
    static var pushupList = [SavedPushup]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeViewController.pushupList.count
    }
    
    @IBOutlet weak var underlineLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pushup = HomeViewController.pushupList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PushupCell") as! PushupCell
        
        cell.setPost(pushup: pushup)
        cell.selectionStyle = .none
        return cell
    }
    
    @IBOutlet weak var totalPushupsLabel: UILabel!
    @IBAction func infoAction(_ sender: Any) {
        let infoMessage = UIAlertController(title: "You can delete any pushup entry by swiping left on it.", message: nil, preferredStyle: .alert)
        infoMessage.view.tintColor = TabViewController.tintColor
        infoMessage.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
        }))
        present(infoMessage, animated: true, completion: nil)
    }
    @IBOutlet weak var navigationBar: UINavigationBar!
}
