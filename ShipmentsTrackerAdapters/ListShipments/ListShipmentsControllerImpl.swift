//
//  ListShipmentsControllerImpl.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation
import ShipmentsTrackerCore

public class ListShipmentsControllerImpl: ListShipmentsController {

    let service: ListShipmentsService

    public init(_ service: ListShipmentsService){
        self.service = service
    }

    public func handle(request: ListShipmentsRequest) {
        let dto = dtoMapper(from: request)
        self.service.execute(with: dto)
    }

    private func dtoMapper(from request: ListShipmentsRequest)
        -> ListShipmentsDTO {
            switch(request){
            case .all:
                return ListShipmentsDTO()
            case .archived:
                return ListShipmentsDTO(with: .onlyArchived)
            case .nonArchived:
                return ListShipmentsDTO(with: .onlyNonArchived)
            }
    }

}
