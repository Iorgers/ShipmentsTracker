//
//  ShowShipmentDetailsResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public protocol ShowShipmentDetailsResult {
    func showShipmentDetails(onFound shipmentDetails: ShipmentDetails) -> Void
    func showShipmentDetailsNotFound() -> Void
}
