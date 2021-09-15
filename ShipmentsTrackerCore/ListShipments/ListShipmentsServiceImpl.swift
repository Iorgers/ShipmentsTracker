//
//  ListShipmentServiceImpl.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class ListShipmentServiceImpl: ListShipmentsService {

    let repository: ShipmentsRepository
    let result: ListShipmentsResult

    public init(
        _ repository: ShipmentsRepository,
        _ result: ListShipmentsResult
        ){
        self.repository = repository
        self.result = result
    }

    public func execute(with dto: ListShipmentsDTO) {

        let data = self.repository.list()

        guard let filter = dto.filter else {
            return self.result.listShipmentsResult(list: data)
        }

        switch(filter){
        case .onlyArchived:
            return self.result.listShipmentsResult(list: data.filter({$0.archived}))
        case .onlyNonArchived:
            return self.result.listShipmentsResult(list: data.filter({!$0.archived}))
        }
    }

}
