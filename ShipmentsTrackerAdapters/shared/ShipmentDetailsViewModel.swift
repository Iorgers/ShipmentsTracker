//
//  ShipmentViewModel.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public struct ShipmentDetailsViewModel {
    public var archived: Bool
    public var status: String?
    public var identifier: String?
    public var trackingCode: String
    public var trackingSteps: [TrackingStepViewModel]

    public init(
        _ archived: Bool,
        _ status: String?,
        _ identifier: String?,
        _ trackingCode: String,
        _ trackingSteps: [TrackingStepViewModel]
    ){
        self.archived = archived
        self.status = status
        self.identifier = identifier
        self.trackingCode = trackingCode
        self.trackingSteps = trackingSteps
    }

    public static let example = ShipmentDetailsViewModel(
        false,
        "Ready to Post",
        "Hub Baseus 4 in 1",
        "LBA123892392",
        [TrackingStepViewModel.Example]
    )
}
