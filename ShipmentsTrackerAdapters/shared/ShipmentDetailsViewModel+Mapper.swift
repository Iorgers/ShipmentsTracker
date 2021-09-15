//
//  ShipmentDetailsViewModel+Mapper.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 26/09/21.
//

import Foundation
import ShipmentsTrackerCore

extension ShipmentDetailsViewModel {

    public static func create(from shipment: ShipmentDetails)
        -> ShipmentDetailsViewModel {
        ShipmentDetailsViewModel(
            shipment.archived,
            shipment.trackingDetails.first?.status,
            shipment.trackingCode.identifier,
            shipment.trackingCode.code,
            TrackingStepViewModel.create(from: shipment))
    }

}
