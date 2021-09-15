//
//  ListShipmentsPresenter.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation
import ShipmentsTrackerCore

public class ListShipmentsPresenterToView:
    ListShipmentsResult {

    var listShipmentsView: ListShipmentsView

    public init(_ view: ListShipmentsView){
        self.listShipmentsView = view
    }

    public func listShipmentsResult(list: [ShipmentDetails]) {

        let shipments = list.map({ shipment in
            ShipmentDetailsViewModel.create(from: shipment)
        })

        self.listShipmentsView.shipmentsViewModel = shipments
    }

}
