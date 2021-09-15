//
//  ListShipmentsService.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public protocol ListShipmentsService {
    func execute(with dto: ListShipmentsDTO) -> Void
}
