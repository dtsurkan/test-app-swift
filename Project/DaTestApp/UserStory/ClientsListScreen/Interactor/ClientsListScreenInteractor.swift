//
//  ClientsListScreenInteractor.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

class ClientsListScreenInteractor: ClientsListScreenInteractorInput {
    weak var output: ClientsListScreenInteractorOutput!
    var serverAPI: DaTestAppServerInterface!

    func loadChats() {
        serverAPI.downloadChats { (result) -> Void in
            if result.count > 0 {
                self.output.chatsDidLoad(result)
            } else {
                self.output.chatsIsEmppty()
            }
        }
    }
}