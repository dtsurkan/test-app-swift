//
//  ClientsListScreenPresenter.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//
import UIKit

class ClientsListScreenPresenter: ClientsListScreenModuleInput, ClientsListScreenViewOutput, ClientsListScreenInteractorOutput
{
    var view: ClientsListScreenViewInput!
    var interactor: ClientsListScreenInteractorInput!
    var router: ClientsListScreenRouterInput!

    //MARK: - ClientsListScreenViewOutput
    func viewIsReady() 
	{
        self.interactor.loadChats()
    }

    //MARK: - ClientsListScreenModuleInput
    func present(fromController controller: UIViewController) {
        self.interactor.loadChats()
        self.router.present(fromController: controller)
    }

    //MARK: - ClientsListScreenInteractorOutput
    func chatsDidLoad(chats:[ChatDomainModel]) {
        view.update(withData: chats)
    }

    func chatsIsEmppty() {
        view.updateWithoutData()
    }
}