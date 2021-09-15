//
//  UpdateShipmentDetailsTests.swift
//  ShipmentsTrackerAdaptersTests
//
//  Created by Iorgers Almeida on 26/09/21.
//

import XCTest
import ShipmentsTrackerCore
import ShipmentsTrackerAdapters

class UpdateShipmentDetailsTests: XCTestCase {

    func testUpdateShipmentDetailsOnUpdated() throws {
        let view = FakeUpdateShipmentDetailsView()

        let presenter = UpdateShipmentDetailsPresenter(view)

        let shipment = ShipmentDetails.Examples.first!

        presenter.updateShipmentDetailsOnUpdated(shipment)

        XCTAssertNotNil(view.onSucessData)
    }

    func testUpdateShipmentDetailsNotFound() throws {
        let view = FakeUpdateShipmentDetailsView()

        let presenter = UpdateShipmentDetailsPresenter(view)

        presenter.updateShipmentDetailsNotFound()

        XCTAssertTrue(view.messageWasSet)
        XCTAssertNil(view.onSucessData)
    }

    func testUpdateShipmentDetailsIsUpToDate() throws {
        let view = FakeUpdateShipmentDetailsView()

        let presenter = UpdateShipmentDetailsPresenter(view)

        presenter.updateShipmentDetailsIsUpToDate()

        XCTAssertTrue(view.messageWasSet)
        XCTAssertNil(view.onSucessData)
    }

    func testUpdateShipmentDetailsNoResponse() throws {
        let view = FakeUpdateShipmentDetailsView()

        let presenter = UpdateShipmentDetailsPresenter(view)

        presenter.updateShipmentDetailsNoResponse()

        XCTAssertTrue(view.messageWasSet)
        XCTAssertNil(view.onSucessData)
    }

    func testUpdateShipmentDetailsGatewayError() throws {
        let view = FakeUpdateShipmentDetailsView()

        let presenter = UpdateShipmentDetailsPresenter(view)

        presenter.updateShipmentDetailsGatewayError()

        XCTAssertTrue(view.messageWasSet)
        XCTAssertNil(view.onSucessData)
    }

}
