//
//  AddTrackingCodeServiceImpl.swift
//  Domain
//
//  Created by Iorgers Almeida on 10/09/21.
//

import Foundation

public class AddTrackingCodeServiceImpl:
    ShipmentDetailsGatewayResponseHandler,
    AddTrackingCodeService {

    let repository: ShipmentsRepository
    let gateway: ShipmentDetailsGateway
    let result: AddTrackingCodeResult

    public init(
        _ repository: ShipmentsRepository,
        _ gateway: ShipmentDetailsGateway,
        _ result: AddTrackingCodeResult
    ){
        self.repository = repository
        self.gateway = gateway
        self.result = result
    }

    public func execute(with dto: AddTrackingCodeDTO) {

        let shipmentNotFound = self.repository.get(for: dto.trackingCode) == nil

        guard shipmentNotFound else {
            return self.result.addTrackingCodeDuplicated()
        }

        let trackingCode = TrackingCode(
            with: dto.trackingCode,
            using: dto.identifier)

        self.gateway.retreiveShipmentDetails(
            for: trackingCode,
            handler: self)
    }

    public func onRetreived(shipmentDetails: ShipmentDetails) {
        self.repository.add(shipmentDetails)
        self.result.addTrackingCodeSucess()
    }

    public func onInvalidCodeReponse() {
        self.result.addTrackingCodeInvalid()
    }

    public func onNotFoundResponse() {
        self.result.addTrackingCodeNotFound()
    }

    public func onNoResponse() {
        self.result.addTrackingCodeNoResponse()
    }

}
