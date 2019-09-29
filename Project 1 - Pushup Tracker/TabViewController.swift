//
//  MainViewController.swift
//  Pushups
//
//  Created by Hunter Casillas on 9/26/19.
//  Copyright © 2019 Hunter Casillas. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBarController?.tabBar.tintColor = TabViewController.tintColor
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    static var textColor = UIColor(red: 254.00/255, green: 167.00/255, blue: 0.00/255, alpha: 1.00)
    static var tintColor = UIColor(red: 0.00/255, green: 55.00/255, blue: 70.00/255, alpha: 1.00)
}
