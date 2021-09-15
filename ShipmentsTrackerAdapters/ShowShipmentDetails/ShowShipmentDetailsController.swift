//
//  ShowShipmentDetailsController.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 18/09/21.
//

import Foundation

public protocol ShowShipmentDetailsController {
    func handle(request: ShowShipmentDetailsRequest) -> Void
}
