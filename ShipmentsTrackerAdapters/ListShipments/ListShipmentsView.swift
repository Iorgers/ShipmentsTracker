//
//  ListShipmentsView.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public protocol ListShipmentsView {
    var shipmentsViewModel: [ShipmentDetailsViewModel] { get set }
}
