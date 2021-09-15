//
//  ShowShipmentDetailsServiceImpl.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class ShowShipmentDetailsServiceImpl:
    ShowShipmentDetailsService {

    let result: ShowShipmentDetailsResult
    let repository: ShipmentsRepository

    public init(
        _ repository: ShipmentsRepository,
        _ result: ShowShipmentDetailsResult
    ){
        self.result = result
        self.repository = repository
    }

    public func execute(with dto: ShowShipmentDetailsDTO) {

        guard
            let shipment = self.repository.get(for: dto.trackingCode)
        else {
            return result.showShipmentDetailsNotFound()
        }

        result.showShipmentDetails(onFound: shipment)
    }

}
