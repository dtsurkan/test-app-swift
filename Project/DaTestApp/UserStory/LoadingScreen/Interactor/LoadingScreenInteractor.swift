//
//  LoadingScreenInteractor.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import Foundation

class LoadingScreenInteractor: LoadingScreenInteractorInput {
    weak var output: LoadingScreenInteractorOutput!

    func loadResources() {

        //some of resources loading should be here
        //but it is a test app and there is only the simulation

        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.finishLoadingSimulation()
        })
    }

    func finishLoadingSimulation() {
        self.output.dataIsReady()
    }
}