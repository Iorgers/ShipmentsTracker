//
//  AdaptersTests.swift
//  AdaptersTests
//
//  Created by Iorgers Almeida on 13/09/21.
//

import XCTest
@testable import ShipmentsTrackerCore
@testable import ShipmentsTrackerAdapters

class AdaptersTests: XCTestCase {

    func testAddTrackingCodePresenterSucess() throws {

        let view = FakeAddTrackingCodeView()

        let presenter = AddTrackingCodePresenter(view)

        presenter.addTrackingCodeSucess()

        XCTAssert(view.lastErrorData == nil)
        XCTAssert(view.didSetCount == 1)
    }

    func testAddTrackingCodePresenterInvalid() throws {

        let view = FakeAddTrackingCodeView()

        let presenter = AddTrackingCodePresenter(view)

        presenter.addTrackingCodeInvalid()

        XCTAssert(view.lastErrorData != nil)
        XCTAssert(view.didSetCount == 1)
    }

    func testAddTrackingCodePresenterNotFound() throws {

        let view = FakeAddTrackingCodeView()

        let presenter = AddTrackingCodePresenter(view)

        presenter.addTrackingCodeNotFound()

        XCTAssert(view.lastErrorData != nil)
        XCTAssert(view.didSetCount == 1)
    }

    func testAddTrackingCodePresenterDuplicated() throws {

        let view = FakeAddTrackingCodeView()

        let presenter = AddTrackingCodePresenter(view)

        presenter.addTrackingCodeDuplicated()

        XCTAssert(view.lastErrorData != nil)
        XCTAssert(view.didSetCount == 1)
    }


    func testAddTrackingCodePresenterNoResponse() throws {

        let view = FakeAddTrackingCodeView()

        let presenter = AddTrackingCodePresenter(view)

        presenter.addTrackingCodeNoResponse()

        XCTAssert(view.lastErrorData != nil)
        XCTAssert(view.didSetCount == 1)
    }

}
