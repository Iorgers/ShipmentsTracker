//
//  InMemoryShipmentsRepository.swift
//  Domain
//
//  Created by Iorgers Almeida on 11/09/21.
//

import Foundation

public class InMemoryShipmentsRepository: ShipmentsRepository {

    public var shipments = [ShipmentDetails]()

    public init() {}

    public func get(for trackingCode: String) -> ShipmentDetails? {
        shipments.first(where: {$0.trackingCode.code == trackingCode})
    }

    public func add(_ shipmentInfo: ShipmentDetails) {
        self.shipments.append(shipmentInfo)
    }

    public func list() -> [ShipmentDetails] {
        shipments
    }

    public func update(_ shipmentInfo: ShipmentDetails) {
        self.shipments = self.shipments.map({
            let mustUpdate = shipmentInfo.trackingCode.code == $0.trackingCode.code
            return mustUpdate ? shipmentInfo : $0
        })
    }
}
