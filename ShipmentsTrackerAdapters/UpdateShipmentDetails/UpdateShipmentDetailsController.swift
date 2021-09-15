//
//  UpdateShipmentDetailsController.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 19/09/21.
//

import Foundation

public protocol UpdateShipmentDetailsController {
    func handle(request: UpdateShipmentDetailsRequest) -> Void
}
