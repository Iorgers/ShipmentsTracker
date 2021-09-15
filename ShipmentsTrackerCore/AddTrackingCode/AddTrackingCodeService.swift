//
//  AddTrackingCodeService.swift
//  Domain
//
//  Created by Iorgers Almeida on 10/09/21.
//

import Foundation

public protocol AddTrackingCodeService: AnyObject{
    func execute(with dto: AddTrackingCodeDTO) -> Void
}
