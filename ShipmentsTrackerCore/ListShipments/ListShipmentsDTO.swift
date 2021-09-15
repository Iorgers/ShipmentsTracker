//
//  ListShipmentsDTO.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public enum ListShipmentsFilterOptions {
    case onlyArchived, onlyNonArchived
}

public struct ListShipmentsDTO {
    let filter: ListShipmentsFilterOptions?

    public init(){
        self.filter = nil
    }

    public init(with filter: ListShipmentsFilterOptions){
        self.filter = filter
    }
}
