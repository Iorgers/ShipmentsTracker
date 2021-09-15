//
//  UpdateShipmentDetailsResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public protocol UpdateShipmentDetailsResult {
    func updateShipmentDetailsOnUpdated(_ data: ShipmentDetails) -> Void
    func updateShipmentDetailsNotFound() -> Void
    func updateShipmentDetailsIsUpToDate() -> Void
    func updateShipmentDetailsNoResponse() -> Void
    func updateShipmentDetailsGatewayError() -> Void
}
