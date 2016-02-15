//
//  LoadingScreenPresenter.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

class LoadingScreenPresenter: LoadingScreenModuleInput, LoadingScreenViewOutput, LoadingScreenInteractorOutput {
    var view: LoadingScreenViewInput!
    var interactor: LoadingScreenInteractorInput!
    var router: LoadingScreenRouterInput!
    weak var output : LoadingScreenModuleOutput?

    //MARK: - LoadingScreenViewOutput
    func viewIsReady() {
        view.animateLoading();
        self.interactor.loadResources()
    }

    //MARK: - LoadingScreenModuleInput
    func presentFromWindow(window: UIWindow) {
       self.router.presentFromWindow(window)
    }

    //MARK: - LoadScreenInteractor output
    func dataIsReady() {
        self.view.stopAnimating()
        self.output?.loadingDidFinished()
    }

    func controller() -> UIViewController {
        return view.controller()
    }

}