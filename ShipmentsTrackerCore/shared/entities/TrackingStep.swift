//
//  TrackingStep.swift
//  Domain
//
//  Created by Iorgers Almeida on 11/09/21.
//

import Foundation

public struct TrackingStep {
    public let currentlyIn: String
    public let timeStamp: Date
    public let timeZone: TimeZone?
    public let sentTo: String?
    public let status: String

    public init (
        currentlyIn: String,
        timeStamp: Date,
        timeZone: TimeZone?,
        sentTo: String?,
        status: String
    ) {
        self.currentlyIn = currentlyIn
        self.timeStamp = timeStamp
        self.timeZone = timeZone
        self.sentTo = sentTo
        self.status = status
    }

    public static let Examples = [

        TrackingStep(
            currentlyIn: "China",
            timeStamp: Date(timeIntervalSinceNow: 0),
            timeZone: TimeZone(abbreviation: "GTM+8"),
            sentTo: nil,
            status: "Postado"),

        TrackingStep(
            currentlyIn: "China",
            timeStamp: Date(timeIntervalSinceNow: 60 * 60 * 24),
            timeZone: TimeZone(abbreviation: "GTM+8"),
            sentTo: nil,
            status: "Chegou no centro de Distribuição"),

        TrackingStep(
            currentlyIn: "China",
            timeStamp: Date(timeIntervalSinceNow: 60 * 60 * 24 + 5 * 60),
            timeZone: TimeZone(abbreviation: "GTM+8"),
            sentTo: nil,
            status: "Saiu do centro de Distribuição"),

        TrackingStep(
            currentlyIn: "UNIDADE INTERNACIAL CURITIBA - CURITIBA/PR",
            timeStamp: Date(timeIntervalSinceNow: 60 * 60 * 24 + 5 * 60),
            timeZone: TimeZone(abbreviation: "GTM-3"),
            sentTo: nil,
            status: "Recebido pelos Correios do Brasil")

    ]
}
