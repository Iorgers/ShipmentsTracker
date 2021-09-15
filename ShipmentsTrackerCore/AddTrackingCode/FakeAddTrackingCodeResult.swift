//
//  FakeAddTrackingCodeResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 12/09/21.
//

import Foundation

public class FakeAddTrackingCodeResult: AddTrackingCodeResult {

    public var sucessWasCalled = false
    public var invalidWasCalled = false
    public var notFoundWasCalled = false
    public var duplicatedWasCalled = false
    public var noResponseWasCalled = false

    public init () {}

    public func addTrackingCodeSucess() {
        self.sucessWasCalled = true
    }

    public func addTrackingCodeInvalid() {
        self.invalidWasCalled = true
    }

    public func addTrackingCodeNotFound() {
        self.notFoundWasCalled = true
    }

    public func addTrackingCodeDuplicated() {
        self.duplicatedWasCalled = true
    }

    public func addTrackingCodeNoResponse() {
        self.noResponseWasCalled = true
    }

}
