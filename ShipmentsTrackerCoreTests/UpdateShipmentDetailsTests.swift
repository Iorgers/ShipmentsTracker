//
//  UpdateShipmentDetailsTests.swift
//  DomainTests
//
//  Created by Iorgers Almeida on 12/09/21.
//

import XCTest
@testable import ShipmentsTrackerCore

class UpdateShipmentDetailsTest: XCTestCase {

    var repository = FakeShipmentsRepository()
    var gateway = FakeShipmentDetailsGateway()

    func testUpdateShipmentDetails() {

        let trackingCode = "TestTrackingCode"

        self.repository.add(ShipmentDetails(for: trackingCode))

        let result = FakeUpdateShipmentDetailsResult()
        let service = UpdateShipmentDetailsServiceImpl(repository, gateway, result)

        service.execute(with: UpdateShipmentDetailsDTO(for: trackingCode))

        XCTAssertTrue(repository.getWasCalled)
        XCTAssertTrue(gateway.retreiveShipmentDetailsWasCalled)

        let newTrackingCode = TrackingCode(with: trackingCode)
        
        let trackingStep = TrackingStep(
            currentlyIn: "TestSite",
            timeStamp: Date(timeIntervalSinceNow: 0),
            timeZone: nil,
            sentTo: nil,
            status: "Posted")

        let shipmentWithUpdates = ShipmentDetails(
            for: newTrackingCode,
            with: [trackingStep])

        gateway.onRetreived(shipmentDetails: shipmentWithUpdates)

        XCTAssertTrue(result.onSuccessWasCalled)
        XCTAssertTrue(repository.updateWasCalled)
    }

    func testUpdateShipmentDetailsInvalidGatewayResponse() {

        let trackingCode = "TestTrackingCode"

        self.repository.add(ShipmentDetails(for: trackingCode))

        let result = FakeUpdateShipmentDetailsResult()
        let service = UpdateShipmentDetailsServiceImpl(repository, gateway, result)

        service.execute(with: UpdateShipmentDetailsDTO(for: trackingCode))

        XCTAssertTrue(repository.getWasCalled)

        gateway.onInvalidCodeReponse()

        XCTAssertTrue(result.gatewayErrorWasCalled)
        XCTAssertFalse(repository.updateWasCalled)
    }

    func testUpdateShipmentDetailsNotFoundGatewayResponse() {

        let trackingCode = "TestTrackingCode"

        self.repository.add(ShipmentDetails(for: trackingCode))

        let result = FakeUpdateShipmentDetailsResult()
        let service = UpdateShipmentDetailsServiceImpl(repository, gateway, result)

        service.execute(with: UpdateShipmentDetailsDTO(for: trackingCode))

        XCTAssertTrue(repository.getWasCalled)
        XCTAssertTrue(gateway.retreiveShipmentDetailsWasCalled)

        gateway.onNotFoundResponse()

        XCTAssertTrue(result.gatewayErrorWasCalled)
        XCTAssertFalse(repository.updateWasCalled)
    }

    func testUpdateShipmentDetailsNoResponse() {

        let trackingCode = "TestTrackingCode"

        self.repository.add(ShipmentDetails(for: trackingCode))

        let result = FakeUpdateShipmentDetailsResult()
        let service = UpdateShipmentDetailsServiceImpl(repository, gateway, result)

        service.execute(with: UpdateShipmentDetailsDTO(for: trackingCode))

        XCTAssertTrue(repository.getWasCalled)
        XCTAssertTrue(gateway.retreiveShipmentDetailsWasCalled)

        gateway.onNoResponse()

        XCTAssertTrue(result.noResponseWasCalled)
        XCTAssertFalse(repository.updateWasCalled)
    }

    func testUpdateShipmentDetailsNotFound(){

        let trackingCode = "TestTrackingCode"
        let result = FakeUpdateShipmentDetailsResult()
        let service = UpdateShipmentDetailsServiceImpl(repository, gateway, result)

        service.execute(with: UpdateShipmentDetailsDTO(for: trackingCode))

        XCTAssertTrue(repository.getWasCalled)
        XCTAssertTrue(result.notFoundWasCalled)
    }

}
