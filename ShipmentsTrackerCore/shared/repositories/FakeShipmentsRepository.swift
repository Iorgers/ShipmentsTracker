//
//  FakeShipmentsRepository.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class FakeShipmentsRepository: ShipmentsRepository {

    let wrappee: ShipmentsRepository

    var getWasCalled: Bool { self.getCalledCount > 0 }
    var addWasCalled: Bool { self.addCalledCount > 0 }
    var listWasCalled: Bool { self.listCalledCount > 0 }
    var updateWasCalled: Bool { self.updateCalledCount > 0 }

    var getCalledCount = 0
    var addCalledCount = 0
    var listCalledCount = 0
    var updateCalledCount = 0

    public init(){
        self.wrappee = InMemoryShipmentsRepository()
    }

    public init(_ wrappee: ShipmentsRepository){
        self.wrappee = wrappee
    }

    public func get(for trackingCode: String) -> ShipmentDetails? {
        self.getCalledCount += 1
        return self.wrappee.get(for: trackingCode)
    }

    public func add(_ shipmentInfo: ShipmentDetails) {
        self.addCalledCount += 1
        self.wrappee.add(shipmentInfo)
    }

    public func list() -> [ShipmentDetails] {
        self.listCalledCount += 1
        let result = self.wrappee.list()
        return result
    }

    public func update(_ shipmentInfo: ShipmentDetails) {
        self.updateCalledCount += 1
        self.wrappee.update(shipmentInfo)
    }
}
