//
//  ClientsListScreenRouter.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

class ClientsListScreenRouter: ClientsListScreenRouterInput {

    var presenter: ClientsListScreenPresenter!
    weak var controller: UIViewController!

    let transitioningController = ClientsListAnimatedTransitioning()

    func present(fromController controller: UIViewController) {
        controller.presentViewController(self.controller, animated: true) { () -> Void in }
    }

    func transitionController() -> UIViewControllerAnimatedTransitioning {
        return transitioningController
    }
}

