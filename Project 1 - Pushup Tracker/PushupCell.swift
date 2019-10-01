//
//  PushupCell.swift
//  Pushups
//
//  Created by Hunter Casillas on 9/28/19.
//  Copyright © 2019 Hunter Casillas. All rights reserved.
//

import UIKit

class PushupCell: UITableViewCell, UITextViewDelegate {

    let formatter = DateFormatter()

    @IBOutlet weak var pushupsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setPost(pushup: SavedPushup) {
        pushupsLabel.text = String(pushup.pushups)
        formatter.dateFormat = "MMMM d, yyyy"
        let currentDate: String = String((formatter.string(from: pushup.date)))
        dateLabel.text = currentDate
    }
}
