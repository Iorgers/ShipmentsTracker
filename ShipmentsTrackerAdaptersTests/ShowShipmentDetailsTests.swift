//
//  ShowShipmentDetailsTests.swift
//  ShipmentsTrackerAdaptersTests
//
//  Created by Iorgers Almeida on 18/09/21.
//

import XCTest
@testable import ShipmentsTrackerCore
@testable import ShipmentsTrackerAdapters

class ShowShipmentDetailsTests: XCTestCase {

    func testShowShipmentDetailsPresenterOnFound() throws {

        let view = FakeShowShipmentDetailsView()

        let presenter = ShowShipmentDetailsPresenter(view)

        let shipment  = ShipmentDetails.Examples.first!

        presenter.showShipmentDetails(onFound: shipment)

        guard
            let result = view.shipmentDetails
        else {
            return XCTFail()
        }

        let firstStepAndDetailsMatches =
            result.trackingSteps.first?.currentlyIn ==
            shipment.trackingDetails.first?.currentlyIn

        XCTAssert(result.archived == shipment.archived)
        XCTAssert(result.status == shipment.trackingDetails.first?.status ?? "")
        XCTAssert(result.identifier == shipment.trackingCode.identifier)
        XCTAssert(result.trackingCode == shipment.trackingCode.code)
        XCTAssert(result.trackingSteps.count == shipment.trackingDetails.count)
        XCTAssert(firstStepAndDetailsMatches)
        XCTAssert(view.shipmentDetailsWasSet)
    }

    func testShowShipmentDetailsPresenterNotFound() throws {

        let view = FakeShowShipmentDetailsView()

        let presenter = ShowShipmentDetailsPresenter(view)

        presenter.showShipmentDetailsNotFound()

        XCTAssert(view.shipmentDetailsWasSet)
        XCTAssert(view.shipmentDetails == nil)
    }

}
