//
//  ListShipmentsTests.swift
//  DomainTests
//
//  Created by Iorgers Almeida on 13/09/21.
//

import XCTest
@testable import ShipmentsTrackerCore

class ListShipmentsTests: XCTestCase {

    var repository = FakeShipmentsRepository()
    var result = FakeListShipmentsResult()

    override func setUpWithError() throws {
        repository = FakeShipmentsRepository()
        result = FakeListShipmentsResult()

        let deliveredShipment = ShipmentDetails(for: "Archived", archived: true)
        let onWayShipment = ShipmentDetails(for: "NonArchived", archived: false)

        repository.add(deliveredShipment)
        repository.add(onWayShipment)
    }

    func testListShipments() {
        let service = ListShipmentServiceImpl(self.repository, self.result)

        service.execute(with: ListShipmentsDTO())

        let resultAll =
            self.result.onResultData?.count ?? 0 == repository.list().count

        XCTAssert(resultAll)
        XCTAssert(self.repository.listWasCalled)
    }

    func testListShipmentsOnlyArchived(){
        let service = ListShipmentServiceImpl(self.repository, self.result)

        service.execute(with: ListShipmentsDTO(with: .onlyArchived))

        guard
            let archived = result.onResultData?.first
        else {
            return XCTFail()
        }

        XCTAssert(archived.trackingCode.code == "Archived")
        XCTAssert(self.result.onResultData?.count ?? 0 == 1)
        XCTAssert(self.repository.listWasCalled)
    }

    func testListShipmentsOnlyNonArchived(){
        let service = ListShipmentServiceImpl(self.repository, self.result)

        service.execute(with: ListShipmentsDTO(with: .onlyNonArchived))

        guard
            let archived = result.onResultData?.first
        else {
            return XCTFail()
        }

        XCTAssert(archived.trackingCode.code == "NonArchived")
        XCTAssert(self.result.onResultData?.count ?? 0 == 1)
        XCTAssert(self.repository.listWasCalled)
    }

}
