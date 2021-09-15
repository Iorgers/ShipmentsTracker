//
//  FakeListShipmentsService.swift
//  Domain
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public class FakeListShipmentService: ListShipmentsService{

    public var executeCalledCount = 0
    
    public var executeWasCalled: Bool{
        executeCalledCount > 0
    }
    
    public var lastExecuteData: ListShipmentsDTO?
    
    public init() {}

    public func execute(with dto: ListShipmentsDTO) {
        executeCalledCount += 1
        lastExecuteData = dto
    }

}
