//
//  AppDelegate.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08.02.16.
//  Copyright © 2016 Maksim Bazarov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let router = RootRouter()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject:AnyObject]?) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = UIColor.whiteColor()

        // Root router initialization
        router.setupRouter(window: window!)

        return true
    }
}

