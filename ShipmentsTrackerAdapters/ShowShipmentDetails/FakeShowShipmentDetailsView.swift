//
//  FakeShowShipmentDetailsView.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 18/09/21.
//

import Foundation

public class FakeShowShipmentDetailsView:
    ShowShipmentDetailsView {

    public var shipmentDetailsDidSetCount = 0

    public var shipmentDetailsWasSet: Bool {
        shipmentDetailsDidSetCount > 0
    }

    public var shipmentDetails: ShipmentDetailsViewModel? {
        didSet {
            self.shipmentDetailsDidSetCount += 1
        }
    }

    public init() {}
}
