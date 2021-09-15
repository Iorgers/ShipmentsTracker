//
//  TrackingCode.swift
//  Domain
//
//  Created by Iorgers Almeida on 11/09/21.
//

import Foundation

public struct TrackingCode {
    public var identifier: String?
    public let code: String

    public init(with code: String, using identifier: String?){
        self.identifier = identifier
        self.code = code
    }

    public init(with code: String){
        self.identifier = nil
        self.code = code
    }
}
