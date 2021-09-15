//
//  DomainTests.swift
//  DomainTests
//
//  Created by Iorgers Almeida on 10/09/21.
//

import XCTest
@testable import ShipmentsTrackerCore

class AddTrackingCodeTests: XCTestCase {

    var gateway = FakeShipmentDetailsGateway()
    var repository = FakeShipmentsRepository()
    var result = FakeAddTrackingCodeResult()

    override func setUpWithError() throws {
        self.gateway = FakeShipmentDetailsGateway()
        self.repository = FakeShipmentsRepository()
        self.result = FakeAddTrackingCodeResult()
    }

    func testAddTrackingCode() throws {
        let trackingCode = "TestTrackingCode"

        let service = AddTrackingCodeServiceImpl(
            self.repository,
            self.gateway,
            self.result)

        let shipmentDetails = ShipmentDetails(for: trackingCode)

        let dto = AddTrackingCodeDTO(for: trackingCode)

        service.execute(with: dto)

        XCTAssertTrue(self.repository.getWasCalled)
        XCTAssertTrue(self.gateway.retreiveShipmentDetailsWasCalled)

        self.gateway.onRetreived(shipmentDetails: shipmentDetails)

        XCTAssertTrue(self.repository.addWasCalled)
        XCTAssertTrue(self.result.sucessWasCalled)
    }

    func testAddTrackingCodeDuplicated() throws {
        let trackingCode = "TestTrackingCode"

        let service = AddTrackingCodeServiceImpl(
            self.repository,
            self.gateway,
            self.result)

        self.repository.add(ShipmentDetails(for: trackingCode))

        let dto = AddTrackingCodeDTO(for: trackingCode)

        service.execute(with: dto)

        XCTAssertFalse(self.gateway.retreiveShipmentDetailsWasCalled)
        XCTAssertTrue(self.repository.getWasCalled)
        XCTAssertTrue(result.duplicatedWasCalled)
    }

    func testAddTrackingCodeNoResponse() throws {
        let trackingCode = "TestTrackingCode"

        let service = AddTrackingCodeServiceImpl(
            self.repository,
            self.gateway,
            self.result)

        let dto = AddTrackingCodeDTO(for: trackingCode)

        service.execute(with: dto)

        XCTAssertTrue(self.repository.getWasCalled)
        XCTAssertTrue(self.gateway.retreiveShipmentDetailsWasCalled)

        self.gateway.onNoResponse()

        XCTAssertTrue(result.noResponseWasCalled)
    }

    func testAddTrackingCodeInvalid() throws {
        let trackingCode = "TestTrackingCode"

        let service = AddTrackingCodeServiceImpl(
            self.repository,
            self.gateway,
            self.result)

        let dto = AddTrackingCodeDTO(for: trackingCode)

        service.execute(with: dto)

        XCTAssertTrue(self.repository.getWasCalled)
        XCTAssertTrue(self.gateway.retreiveShipmentDetailsWasCalled)

        self.gateway.onInvalidCodeReponse()

        XCTAssertTrue(result.invalidWasCalled)
    }

    func testAddTrackingCodeNotFound() throws {
        let trackingCode = "TestTrackingCode"

        let service = AddTrackingCodeServiceImpl(
            self.repository,
            self.gateway,
            self.result)

        let dto = AddTrackingCodeDTO(for: trackingCode)

        service.execute(with: dto)

        XCTAssertTrue(self.repository.getWasCalled)
        XCTAssertTrue(self.gateway.retreiveShipmentDetailsWasCalled)

        self.gateway.onNotFoundResponse()

        XCTAssertTrue(result.notFoundWasCalled)
    }

}
