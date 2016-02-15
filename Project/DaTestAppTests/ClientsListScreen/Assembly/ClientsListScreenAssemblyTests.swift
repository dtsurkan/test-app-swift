//
//  ClientsListScreenAssemblyTests.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import XCTest
@testable import DaTestApp

class ClientsListScreenAssemblyTests: XCTestCase {

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
        let moduleInput = ClientsListScreenAssembly.createModule()

        //when
        let presenter = moduleInput as! ClientsListScreenPresenter
        let viewController = presenter.view as! ClientsListScreenViewController
        let interactor = presenter.interactor as! ClientsListScreenInteractor

        //then
        XCTAssertNotNil(viewController.output, "ClientsListScreenViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ClientsListScreenPresenter, "output is not ClientsListScreenPresenter")


        XCTAssertNotNil(presenter.view, "view in ClientsListScreenPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ClientsListScreenPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ClientsListScreenRouter, "router is not ClientsListScreenRouter")


        XCTAssertNotNil(interactor.output, "output in ClientsListScreenInteractor is nil after configuration")
    }
}
