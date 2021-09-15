//
//  ShipmentDetailsGateway.swift
//  Domain
//
//  Created by Iorgers Almeida on 10/09/21.
//

import Foundation

public protocol ShipmentDetailsGatewayResponseHandler: AnyObject {
    func onRetreived(shipmentDetails: ShipmentDetails) -> Void
    func onInvalidCodeReponse() -> Void
    func onNotFoundResponse() -> Void
    func onNoResponse() -> Void
}

public protocol ShipmentDetailsGateway: AnyObject {
    func retreiveShipmentDetails(
        for trackingCode: TrackingCode,
        handler: ShipmentDetailsGatewayResponseHandler
    ) -> Void
}
