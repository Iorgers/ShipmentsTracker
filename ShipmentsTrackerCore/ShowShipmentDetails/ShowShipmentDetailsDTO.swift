//
//  ShowShipmentDetailsDTO.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public struct ShowShipmentDetailsDTO {
    let trackingCode: String

    public init(for trackingCode: String){
        self.trackingCode = trackingCode
    }
}
