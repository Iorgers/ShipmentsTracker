//
//  FakeAddTrackingCodeService.swift
//  ShipmentsTrackerCore
//
//  Created by Iorgers Almeida on 15/09/21.
//

import Foundation

public class FakeAddTrackingCodeService:
    AddTrackingCodeService {

    public var executeCalledCount = 0

    public var executeWasCalled: Bool {
        executeCalledCount > 0
    }

    public var lastExecuteData: AddTrackingCodeDTO?

    public init () {}

    public func execute(with dto: AddTrackingCodeDTO) {
        self.lastExecuteData = dto
        self.executeCalledCount += 1
    }
}
