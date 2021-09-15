//
//  ShipmentsRepository.swift
//  Domain
//
//  Created by Iorgers Almeida on 10/09/21.
//

import Foundation

public protocol ShipmentsRepository: AnyObject{
    func get(for trackingCode: String) -> ShipmentDetails?
    func add(_ shipmentInfo: ShipmentDetails)
    func list() -> [ShipmentDetails]
    func update(_ shipmentInfo: ShipmentDetails)
}
