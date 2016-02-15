//
//  RootRouter.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08.02.16.
//  Copyright © 2016 Maksim Bazarov. All rights reserved.
//

import UIKit

class RootRouter: LoadingScreenModuleOutput {

    let loadingScreen = LoadingScreenAssembly.createModule()
    let clientListScreen = ClientsListScreenAssembly.createModule()

    func setupRouter(window window: UIWindow) {
        loadingScreen.output = self
        loadingScreen.presentFromWindow(window)
    }

    func loadingDidFinished() {
        clientListScreen.present(fromController: loadingScreen.controller())
    }
}
