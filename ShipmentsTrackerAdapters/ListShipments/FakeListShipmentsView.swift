//
//  FakeListShipmentsView.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public class FakeListShipmentsView:
    ListShipmentsView {

    public var didSetCount = 0

    public var didSetWasCalled: Bool {
        didSetCount > 0
    }

    public var shipmentsViewModel: [ShipmentDetailsViewModel] = [] {
        didSet {
            self.didSetCount += 1
        }
    }

    public init() {}
}
