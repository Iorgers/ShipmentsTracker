//
//  UpdateShipmentDetailsService.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public protocol UpdateShipmentDetailsService: AnyObject{
    func execute(with dto: UpdateShipmentDetailsDTO) -> Void
}
