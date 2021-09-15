//
//  ListShipmentsResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public protocol ListShipmentsResult {
    func listShipmentsResult(list: [ShipmentDetails]) -> Void
}
