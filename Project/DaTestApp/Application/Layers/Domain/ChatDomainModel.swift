//
//  ChatDomainModel.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import Foundation

struct ChatDomainModel {
    var id = -1
    var fullName: String?
    var avatarURL: String?
    var lastMessage: String?
    var lastMessageSendingDate: NSDate?
    var ureadCount: Int?
}