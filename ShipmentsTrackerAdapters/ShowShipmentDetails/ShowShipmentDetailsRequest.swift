//
//  ShowShipmentDetailsDTO.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 18/09/21.
//

import Foundation

public struct ShowShipmentDetailsRequest {
    let trackingCode: String

    public init(for trackingCode: String){
        self.trackingCode = trackingCode
    }
}
