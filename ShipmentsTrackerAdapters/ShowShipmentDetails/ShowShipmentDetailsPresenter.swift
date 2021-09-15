//
//  ShowShipmentDetailsPresenterToView.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 18/09/21.
//

import Foundation
import ShipmentsTrackerCore

public class ShowShipmentDetailsPresenter:
    ShowShipmentDetailsResult {

    var showShipmentDetailsView: ShowShipmentDetailsView

    public init(_ view: ShowShipmentDetailsView){
        self.showShipmentDetailsView = view
    }

    public func showShipmentDetails(onFound shipmentDetails: ShipmentDetails) {

        let shipment = ShipmentDetailsViewModel.create(from: shipmentDetails)

        self.showShipmentDetailsView.shipmentDetails = shipment
    }

    public func showShipmentDetailsNotFound() {
        self.showShipmentDetailsView.shipmentDetails = nil
    }

}
