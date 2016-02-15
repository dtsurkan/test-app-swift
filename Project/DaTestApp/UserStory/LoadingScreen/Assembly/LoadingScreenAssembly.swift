//
//  LoadingScreenAssembly.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

class LoadingScreenAssembly {
    class func createModule() -> LoadingScreenModuleInput {
        let vc = initializeViewController()
        let interactor = LoadingScreenInteractor()
        let presenter = LoadingScreenPresenter()
        let router = LoadingScreenRouter()

        router.presenter = presenter
        router.controller = vc

        vc.output = presenter

        interactor.output = presenter

        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router

        return presenter
    }

    private class func initializeViewController() -> LoadingScreenViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("LoadingScreenViewController") as! LoadingScreenViewController

        return vc
    }
}
