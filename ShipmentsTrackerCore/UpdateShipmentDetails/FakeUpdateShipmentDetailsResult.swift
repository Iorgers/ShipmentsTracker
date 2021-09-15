//
//  FakeShipmentDetailsResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class FakeUpdateShipmentDetailsResult:
    UpdateShipmentDetailsResult {

    var onSuccessData: ShipmentDetails?
    var notFoundWasCalled = false
    var onSuccessWasCalled = false
    var onUpdatedWasCalled = false
    var noResponseWasCalled = false
    var gatewayErrorWasCalled = false

    public init() {}

    public func updateShipmentDetailsOnUpdated(_ data: ShipmentDetails) {
        self.onSuccessWasCalled = true
        self.onSuccessData = data
    }

    public func updateShipmentDetailsNotFound() {
        self.notFoundWasCalled = true
    }

    public func updateShipmentDetailsIsUpToDate() {
        self.onUpdatedWasCalled = true
    }

    public func updateShipmentDetailsNoResponse() {
        self.noResponseWasCalled = true
    }

    public func updateShipmentDetailsGatewayError() {
        self.gatewayErrorWasCalled = true
    }

}
