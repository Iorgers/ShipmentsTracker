//
//  FakeShipmentDetailsGateway.swift
//  Domain
//
//  Created by Iorgers Almeida on 11/09/21.
//

import Foundation

public enum ShipmentDetailsGatewayDefaultBehavior {
    case none
    case onRetrived(ShipmentDetails)
    case invalidCodeResponse
    case notFoundResponse
    case noResponse
}

public class FakeShipmentDetailsGateway:
    ShipmentDetailsGatewayResponseHandler,
    ShipmentDetailsGateway {

    public var retreiveShipmentDetailsWasCalled = false
    public var handler: ShipmentDetailsGatewayResponseHandler?

    public var behavior: ShipmentDetailsGatewayDefaultBehavior = .none

    public init () {}

    public init (behavior: ShipmentDetailsGatewayDefaultBehavior) {
        self.behavior = behavior
    }

    public func retreiveShipmentDetails(for trackingCode: TrackingCode, handler: ShipmentDetailsGatewayResponseHandler) {
        self.retreiveShipmentDetailsWasCalled = true
        self.handler = handler

        switch(self.behavior){

        case .invalidCodeResponse:
            self.onInvalidCodeReponse()
        case .notFoundResponse:
            self.onNotFoundResponse()
        case .noResponse:
            self.onNoResponse()
        case .onRetrived(let data):
            self.onRetreived(shipmentDetails: data)
        case .none:
            print("[FakeShipmentDetailsGateway] no default response")
        }

    }

    public func onRetreived(shipmentDetails: ShipmentDetails) {
        self.handler?.onRetreived(shipmentDetails: shipmentDetails)
    }

    public func onInvalidCodeReponse() {
        self.handler?.onInvalidCodeReponse()
    }

    public func onNotFoundResponse() {
        self.handler?.onNotFoundResponse()
    }

    public func onNoResponse() {
        self.handler?.onNoResponse()
    }

}
