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
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
    @IBOutlet weak var logoButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!

    // Open web view on logo click
    @IBAction func logoAction(_ sender: Any) {
        openWebView()
    }
    
    // Open web view on link click
    @IBAction func websiteAction(_ sender: Any) {
        openWebView()
    }
    
    // Open custom web view to hundredpushups.com
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
    
    // Change status bar text color to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
