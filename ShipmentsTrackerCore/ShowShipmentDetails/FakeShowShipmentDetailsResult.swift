//
//  FakeShowShipmentResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class FakeShowShipmentDetailsResult:
    ShowShipmentDetailsResult {

    var onSuccessData: ShipmentDetails?
    var onFoundWasCalled = false
    var notFoundWasCalled = false

    public init() {}

    public func showShipmentDetails(onFound shipmentDetails: ShipmentDetails) {
        self.onSuccessData = shipmentDetails
        self.onFoundWasCalled = true
    }

    public func showShipmentDetailsNotFound() {
        self.notFoundWasCalled = true
    }

}
