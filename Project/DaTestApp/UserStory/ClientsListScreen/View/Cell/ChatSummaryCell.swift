//
//  ChatSummaryCell.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 10.02.16.
//  Copyright © 2016 Maksim Bazarov. All rights reserved.
//

import UIKit

class ChatSummaryCell: UITableViewCell {

    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messagesCountLabel: UILabel!
    
    func fill(withModel model:ChatDomainModel) {
    
        if let name = model.fullName {
            nameLabel.text = name
        } else {
            nameLabel.text = ""
        }

        if let date = model.lastMessageSendingDate {
            timeLabel.text = timestring(fromDate: date)
        } else {
            timeLabel.text = ""
        }
        
        if let message = model.lastMessage {
            messageLabel.text = message
        } else {
            messageLabel.text = ""
        }

        if let count = model.ureadCount {
            messagesCountLabel.text = "+ \(count)"
        } else {
            messageLabel.text = ""
        }
        
        if let imageURL = model.avatarURL {
            avatarImageView.setupImage(fromURL: imageURL)
        }
        
    }
    
    func timestring (fromDate date:NSDate) -> String {
        let formater = NSDateFormatter()
        formater.dateFormat = "h:mm a"
        return formater.stringFromDate(date)
    }
    
}
