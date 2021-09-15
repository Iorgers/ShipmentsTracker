//
//  UpdateShipmentDetailsServiceImpl.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class UpdateShipmentDetailsServiceImpl:
    UpdateShipmentDetailsService,
    ShipmentDetailsGatewayResponseHandler{

    let repository: ShipmentsRepository
    let gateway: ShipmentDetailsGateway
    let result: UpdateShipmentDetailsResult

    var currentShipmentDetails: ShipmentDetails?

    public init(
        _ repository: ShipmentsRepository,
        _ gateway: ShipmentDetailsGateway,
        _ result: UpdateShipmentDetailsResult
    ){
        self.repository = repository
        self.gateway = gateway
        self.result = result
    }

    public func execute(with dto: UpdateShipmentDetailsDTO) {

        self.currentShipmentDetails = repository.get(for: dto.trackingCode)

        guard
            let shipmentDetails = self.currentShipmentDetails
        else {
            return result.updateShipmentDetailsNotFound()
        }

        let identifier = shipmentDetails.trackingCode.identifier

        let trackingCode = TrackingCode(with: dto.trackingCode, using: identifier)

        gateway.retreiveShipmentDetails(for: trackingCode, handler: self)
    }

    public func onRetreived(shipmentDetails: ShipmentDetails) {

        if
            shipmentDetails.trackingDetails.count >
            self.currentShipmentDetails!.trackingDetails.count
        {
            repository.update(shipmentDetails)
            return result.updateShipmentDetailsOnUpdated(shipmentDetails)
        }

        result.updateShipmentDetailsIsUpToDate()
    }

    public func onInvalidCodeReponse() {
        result.updateShipmentDetailsGatewayError()
    }

    public func onNotFoundResponse() {
        result.updateShipmentDetailsGatewayError()
    }

    public func onNoResponse() {
        result.updateShipmentDetailsNoResponse()
    }

}
