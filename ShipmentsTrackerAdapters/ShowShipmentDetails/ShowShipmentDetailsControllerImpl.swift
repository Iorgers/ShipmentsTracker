//
//  ShowShipmentDetailsControllerImpl.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 18/09/21.
//

import Foundation
import ShipmentsTrackerCore

public class ShowShipmentDetailsControllerImpl:
    ShowShipmentDetailsController {

    let service: ShowShipmentDetailsService

    public init(_ service: ShowShipmentDetailsService) {
        self.service = service
    }

    public func handle(request: ShowShipmentDetailsRequest) {
        let dto = ShowShipmentDetailsDTO(for: request.trackingCode)
        self.service.execute(with: dto)
    }
}
