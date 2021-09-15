//
//  AddTrackingCodeController.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public protocol AddTrackingCodeController {
    func handle(trackingCode: String, identifier: String?) -> Void
}
