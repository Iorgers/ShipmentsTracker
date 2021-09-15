//
//  FakeUpdateShipmentDetailsView.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 19/09/21.
//

import Foundation

public class FakeUpdateShipmentDetailsView:
    UpdateShipmentDetailsView {

    public var message: String? {
        didSet {
            self.messageDidSetCount += 1
            self.lastMessage = message
        }
    }

    public var shipmentDetails: ShipmentDetailsViewModel? {
        didSet {
            guard shipmentDetails != nil else { return }
            self.onSucessData = shipmentDetails
        }
    }

    public var messageWasSet: Bool {
        messageDidSetCount > 0
    }

    public var lastMessage: String?
    public var messageDidSetCount: Int = 0
    public var onSucessData: ShipmentDetailsViewModel?

    public init() {}

}
