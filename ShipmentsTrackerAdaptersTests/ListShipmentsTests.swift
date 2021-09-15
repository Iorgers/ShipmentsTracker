//
//  ListShipmentsTests.swift
//  ShipmentsTrackerAdaptersTests
//
//  Created by Iorgers Almeida on 18/09/21.
//

import XCTest
@testable import ShipmentsTrackerCore
@testable import ShipmentsTrackerAdapters

class ListShipmentsTests: XCTestCase {

    func testListShipmentsPresenter() throws {

        let view = FakeListShipmentsView()

        let presenter = ListShipmentsPresenterToView(view)

        let shipments =  ShipmentDetails.Examples

        presenter.listShipmentsResult(list: shipments)

        guard
            let result = view.shipmentsViewModel.first
        else {
            return XCTFail()
        }

        guard let shipment = shipments.first(
            where: {$0.trackingCode.code == result.trackingCode})
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
        XCTAssert(view.shipmentsViewModel.count == shipments.count)
        XCTAssert(view.didSetWasCalled)
    }

}
