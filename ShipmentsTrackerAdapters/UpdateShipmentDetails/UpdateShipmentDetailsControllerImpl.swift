//
//  UpdateShipmentDetailsControllerImpl.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 19/09/21.
//

import Foundation
import ShipmentsTrackerCore

public class UpdateShipmentDetailsControllerImpl:
    UpdateShipmentDetailsController {

    let service: UpdateShipmentDetailsService

    public init(
        _ service: UpdateShipmentDetailsService
    ){
        self.service = service
    }

    public func handle(request: UpdateShipmentDetailsRequest) {
        let dto = UpdateShipmentDetailsDTO(for: request.trackingCode)
        self.service.execute(with: dto)
    }

}
