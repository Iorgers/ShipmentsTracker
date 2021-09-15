//
//  ShipmentsRepositoryLogDecorator.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class ShipmentsRepositoryLogDecorator: ShipmentsRepository {

    let wrappee: ShipmentsRepository

    public init(_ wrappee: ShipmentsRepository){
        self.wrappee = wrappee
    }

    public func get(for trackingCode: String) -> ShipmentDetails? {
        print("[ShipmentsRepositoryLogger] get(for trackingCode: \(trackingCode))")
        return self.wrappee.get(for: trackingCode)
    }

    public func add(_ shipmentInfo: ShipmentDetails) {
        print("[ShipmentsRepositoryLogger] add(_: \(shipmentInfo))")
        self.wrappee.add(shipmentInfo)
    }

    public func list() -> [ShipmentDetails] {
        let result = self.wrappee.list()
        print("[ShipmentsRepositoryLogger] list() -> \(result))")
        return result
    }

    public func update(_ shipmentInfo: ShipmentDetails) {
        print("[ShipmentsRepositoryLogger] update(_: \(shipmentInfo))")
        self.wrappee.update(shipmentInfo)
    }
}
