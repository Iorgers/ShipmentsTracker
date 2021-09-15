//
//  ShipmentViewModel.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 18/09/21.
//

import Foundation

public struct ShipmentViewModel {
    public var archived: Bool
    public var finished: Bool
    public var status: String?
    public var identifier: String?
    public var trackingCode: String

    public init(
        _ archived: Bool,
        _ finished: Bool,
        _ status: String?,
        _ identifier: String?,
        _ trackingCode: String
    ){
        self.archived = archived
        self.finished = finished
        self.status = status
        self.identifier = identifier
        self.trackingCode = trackingCode
    }

    public static let example = ShipmentViewModel(
        false,
        false,
        "Posted",
        "Hub Baseus 4 in 1",
        "LBA123892392"
    )
}
