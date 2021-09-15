//
//  Shipment.swift
//  Domain
//
//  Created by Iorgers Almeida on 11/09/21.
//

import Foundation

public struct ShipmentDetails {

    public let finished: Bool
    public let archived: Bool
    public let trackingCode: TrackingCode
    public let trackingDetails: [TrackingStep]

    public static let Examples = [
        ShipmentDetails(
            for: TrackingCode(with: "TrackingCode", using: "HUB Baseus"),
            with: TrackingStep.Examples),

        ShipmentDetails(
            for: TrackingCode(with: "AnotherTrackingCode", using: "Hustman Mini"),
            with: TrackingStep.Examples),
    ]

    public init(
        for trackingCode: TrackingCode,
        with trackingDetails: [TrackingStep],
        archived: Bool,
        finished: Bool
    ){
        self.finished = finished
        self.archived = archived
        self.trackingCode = trackingCode
        self.trackingDetails = trackingDetails
    }

    public init(
        for trackingCode: TrackingCode,
        with trackingDetails: [TrackingStep]
    ){
        self.finished = false
        self.archived = false
        self.trackingCode = trackingCode
        self.trackingDetails = trackingDetails
    }

    public init(for trackingCode: String){
        self.finished = false
        self.archived = false
        self.trackingCode = TrackingCode(with: trackingCode)
        self.trackingDetails = []
    }

    public init(for trackingCode: String, archived: Bool){
        self.finished = false
        self.archived = archived
        self.trackingCode = TrackingCode(with: trackingCode)
        self.trackingDetails = []
    }

}
