//
//  AddTrackingCodeViewModel.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public struct ErrorViewModel {

    public var title: String
    public var message: String

    public init(
        title: String,
        message: String
    ){
        self.title = title
        self.message = message
    }
}
