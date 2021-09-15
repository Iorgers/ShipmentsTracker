//
//  AddTrackingCodeDTO.swift
//  Domain
//
//  Created by Iorgers Almeida on 10/09/21.
//

import Foundation

public struct AddTrackingCodeDTO{

    let trackingCode: String
    let identifier: String?

    public init(for trackingCode: String){
        self.trackingCode = trackingCode
        self.identifier = nil
    }

    public init(for trackingCode: String, with identifier: String?){
        self.trackingCode = trackingCode
        self.identifier = identifier
    }

}
