//
//  LoadingScreenAssemblyTests.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import XCTest
@testable import DaTestApp

class LoadingScreenAssemblyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAssemblyForViewController() {

        //given
        let moduleInput = LoadingScreenAssembly.createModule()

        //when
        let presenter = moduleInput as! LoadingScreenPresenter
        let viewController = presenter.view as! LoadingScreenViewController
        let interactor = presenter.interactor as! LoadingScreenInteractor

        //then
        XCTAssertNotNil(viewController.output, "LoadingScreenViewController is nil after configuration")
        XCTAssertTrue(viewController.output is LoadingScreenPresenter, "output is not LoadingScreenPresenter")


        XCTAssertNotNil(presenter.view, "view in LoadingScreenPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in LoadingScreenPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is LoadingScreenRouter, "router is not LoadingScreenRouter")


        XCTAssertNotNil(interactor.output, "output in LoadingScreenInteractor is nil after configuration")
    }
}
