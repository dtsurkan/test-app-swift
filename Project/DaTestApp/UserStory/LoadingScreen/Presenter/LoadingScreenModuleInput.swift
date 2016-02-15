//
//  LoadingScreenModuleInput.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

protocol LoadingScreenModuleInput: class {
    weak var output: LoadingScreenModuleOutput? { get set }
    func presentFromWindow(window: UIWindow)

    func controller() -> UIViewController

}