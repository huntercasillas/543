//
//  MoreViewController.swift
//  Pushups
//
//  Created by Hunter Casillas on 9/26/19.
//  Copyright © 2019 Hunter Casillas. All rights reserved.
//

import UIKit
import SafariServices

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
    @IBOutlet weak var logoButton: UIButton!
    @IBAction func logoAction(_ sender: Any) {
        openWebView()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    func openWebView() {
        let pushupURL = URL(string: "https://hundredpushups.com")!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let webViewController = SFSafariViewController(url: pushupURL, configuration: config)
        webViewController.preferredControlTintColor = TabViewController.tintColor
        if #available(iOS 13.0, *) {
            webViewController.modalPresentationStyle = UIModalPresentationStyle.automatic
        } else {
            webViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        }

        present(webViewController, animated: true)
    }

    @IBOutlet weak var websiteButton: UIButton!
    
    @IBAction func websiteAction(_ sender: Any) {
        openWebView()
    }
    
}
