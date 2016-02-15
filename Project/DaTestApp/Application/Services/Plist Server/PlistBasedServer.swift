//
//  PlistBasedServer.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 10.02.16.
//  Copyright © 2016 Maksim Bazarov. All rights reserved.
//

import Foundation

class PlistBasedServer: DaTestAppServerInterface {

    func downloadChats(completion: (chats:[ChatDomainModel]) -> Void) {

        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist"), data = NSArray(contentsOfFile: path) {
            completion(chats: parseData(data))
        }
    }


    private func parseData(data: NSArray) -> [ChatDomainModel] {
        var result = [ChatDomainModel]()

        for item in data {
            var model = ChatDomainModel()
            
            if let id = item["identifier"] as? Int {
                model.id = id
            } else {
                break
            }
            
            if let fullName = item["fullname"] as? String {
                model.fullName = fullName
            }
            if let avatarURL = item["avatarURL"] as? String {
                model.avatarURL = avatarURL
            }

            if let message = item["message"] as? String {
                model.lastMessage = message
            }

            if let unreadMessagesCount = item["unreadMessagesCount"] as? Int {
                model.ureadCount = unreadMessagesCount
            }

            if let sendingDate = item["sendingDate"] as? NSDate {
                model.lastMessageSendingDate = sendingDate
            }

            result.append(model)
        }
        return result
    }
}
