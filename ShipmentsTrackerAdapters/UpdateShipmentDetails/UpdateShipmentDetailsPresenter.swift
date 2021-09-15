//
//  UpdateShipmentDetailsPresenter.swift
//  ShipmentsTrackerAdapters
//
//  Created by Iorgers Almeida on 19/09/21.
//

import Foundation
import ShipmentsTrackerCore

public class UpdateShipmentDetailsPresenter:
    UpdateShipmentDetailsResult {

    var updateShipmentDetailsView: UpdateShipmentDetailsView

    public init(
        _ updateShipmentDetailsView: UpdateShipmentDetailsView
    ) {
        self.updateShipmentDetailsView = updateShipmentDetailsView
    }

    public func updateShipmentDetailsOnUpdated(_ data: ShipmentDetails) {
        self.updateShipmentDetailsView.shipmentDetails =
        ShipmentDetailsViewModel.create(from: data)

        self.updateShipmentDetailsView.message = "Atualizado."
    }

    public func updateShipmentDetailsNotFound() {
        self.updateShipmentDetailsView.message = "Algo deu errado, tente novamente mais tarde."
    }

    public func updateShipmentDetailsIsUpToDate() {
        self.updateShipmentDetailsView.message = "Nenhuma atualização até o momento"
    }

    public func updateShipmentDetailsNoResponse() {

        self.updateShipmentDetailsView.message = "Falha de internet, tente novamente mais tarde"
    }

    public func updateShipmentDetailsGatewayError() {
        self.updateShipmentDetailsView.message = "Algo deu errado, tente novamente mais tarde."
    }

}
