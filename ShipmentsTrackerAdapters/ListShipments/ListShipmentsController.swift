//
//  ListShipmentsController.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public protocol ListShipmentsController {
    func handle(request: ListShipmentsRequest) -> Void
}
