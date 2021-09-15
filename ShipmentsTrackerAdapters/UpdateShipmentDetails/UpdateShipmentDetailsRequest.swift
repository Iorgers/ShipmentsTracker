//
//  UpdateShipmentDetailsRequest.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 19/09/21.
//

import Foundation

public struct UpdateShipmentDetailsRequest {
    let trackingCode: String

    public init(
        from trackingCode: String
    ){
        self.trackingCode = trackingCode
    }
}
