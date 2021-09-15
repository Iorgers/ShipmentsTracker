//
//  UpdateShipmentDetailsView.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 19/09/21.
//

import Foundation

public protocol UpdateShipmentDetailsView {
    var message: String? { get set }
    var shipmentDetails: ShipmentDetailsViewModel? { get set }
}
