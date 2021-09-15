//
//  FakeListShipmentsResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class FakeListShipmentsResult:
    ListShipmentsResult {

    var onResultData: [ShipmentDetails]? = nil
    var listShipmentsResultWasCalled = false

    public init() {}

    public func listShipmentsResult(list: [ShipmentDetails]) {
        self.onResultData = list
    }

}
