//
//  ShowShipmentDetailsService.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public protocol ShowShipmentDetailsService {
    func execute(with dto: ShowShipmentDetailsDTO) -> Void
}
