//
//  LoadingScreenRouter.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//
import UIKit
class LoadingScreenRouter: LoadingScreenRouterInput {
    var presenter: LoadingScreenPresenter!
    weak var controller: UIViewController!

    func presentFromWindow(window: UIWindow) {
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}