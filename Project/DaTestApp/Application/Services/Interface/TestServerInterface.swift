//
//  DaTestAppServerInterface.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import Foundation

protocol DaTestAppServerInterface: class {

    func downloadChats(completion: (chats: [ChatDomainModel]) -> Void);
}
