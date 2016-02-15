//
//  ClientsListScreenAssembly.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

class ClientsListScreenAssembly 
{
    class func createModule() -> ClientsListScreenModuleInput 
    {
        let vc = initializeViewController()
        let interactor = ClientsListScreenInteractor()
        let presenter = ClientsListScreenPresenter()
        let router = ClientsListScreenRouter()

        router.presenter = presenter
        router.controller = vc

        vc.output = presenter
        vc.transitioningDelegate = router
        
        interactor.output = presenter
        interactor.serverAPI = PlistBasedServer()

        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router

        return presenter
    }
	
	private class func initializeViewController() -> ClientsListScreenViewController {
	        let sb = UIStoryboard(name: "Main", bundle: nil)
	        let vc = sb.instantiateViewControllerWithIdentifier("ClientsListScreenViewController") as! ClientsListScreenViewController
    
	        return vc
	    } 
}
