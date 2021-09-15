//
//  AddTrackingCodeControllerImpl.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import ShipmentsTrackerCore
import Foundation

public class AddTrackingCodeControllerImpl:
    AddTrackingCodeController {

    let service: AddTrackingCodeService

    public init(_ service: AddTrackingCodeService) {
        self.service = service
    }

    public func handle(trackingCode: String, identifier: String?) {
        let dto = AddTrackingCodeDTO(for: trackingCode, with: identifier)
        self.service.execute(with: dto)
    }
}
