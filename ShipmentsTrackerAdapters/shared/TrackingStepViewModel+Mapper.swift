//
//  TrackingStepViewModel+Mapper.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 26/09/21.
//

import Foundation
import ShipmentsTrackerCore

public extension TrackingStepViewModel {

    static func create(from trackingStep: TrackingStep)
        -> TrackingStepViewModel {

        //TODO: Convert date, instead of using timeStamp.description

        let trackingStep = TrackingStepViewModel(
                trackingStep.currentlyIn,
                trackingStep.timeStamp.description,
                trackingStep.timeZone?.abbreviation(),
                trackingStep.sentTo,
                trackingStep.status)

        return trackingStep
    }

    static func create(from shipment: ShipmentDetails)
        -> [TrackingStepViewModel] {
            shipment.trackingDetails.map({
                TrackingStepViewModel.create(from: $0)
            })
    }

}
