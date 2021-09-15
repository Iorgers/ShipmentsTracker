//
//  TrackingStepViewModel.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public struct TrackingStepViewModel {

    public var currentlyIn: String
    public var timeStamp: String
    public var timeZone: String?
    public var sentTo: String?
    public var status: String

    public init(
        _ currentlyIn: String,
        _ timeStamp: String,
        _ timeZone: String?,
        _ sentTo: String?,
        _ status: String
    ){
        self.currentlyIn = currentlyIn
        self.timeStamp = timeStamp
        self.timeZone = timeZone
        self.sentTo = sentTo
        self.status = status
    }

    public static let Example = TrackingStepViewModel(
        "China",
        "13/08/21 14:02",
        "GTM+8",
        nil,
        "Ready to Post")

}
