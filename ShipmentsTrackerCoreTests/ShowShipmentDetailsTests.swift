//
//  ShowShipmentDetailsTests.swift
//  DomainTests
//
//  Created by Iorgers Almeida on 12/09/21.
//

import XCTest
@testable import ShipmentsTrackerCore

class ShowShipmentDetailsTests: XCTestCase {

    var repository = FakeShipmentsRepository()
    var result = FakeShowShipmentDetailsResult()

    override func setUpWithError() throws {
        self.repository = FakeShipmentsRepository()
        self.result = FakeShowShipmentDetailsResult()
    }

    func testShowShipmentDetails() {

        let trackingCode = "TestTrackingCode"
        let shipment = ShipmentDetails(for: trackingCode)

        repository.add(shipment)

        let service = ShowShipmentDetailsServiceImpl(repository, result)

        let dto = ShowShipmentDetailsDTO(for: trackingCode)

        service.execute(with: dto)

        guard
            let sucessData = result.onSuccessData
        else {
            return XCTFail()
        }

        XCTAssertTrue(repository.getWasCalled)
        XCTAssertTrue(result.onFoundWasCalled)
        XCTAssert(sucessData.trackingCode.code == trackingCode)
    }

    func testShowShipmentDetailsNotFound() {

        let trackingCode = "TestTrackingCode"

        let service = ShowShipmentDetailsServiceImpl(repository, result)

        let dto = ShowShipmentDetailsDTO(for: trackingCode)

        service.execute(with: dto)

        XCTAssertTrue(repository.getWasCalled)
        XCTAssertTrue(result.notFoundWasCalled)
    }

}
