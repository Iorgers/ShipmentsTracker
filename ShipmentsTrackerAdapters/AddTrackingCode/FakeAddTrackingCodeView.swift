//
//  FakeAddTrackingCodeView.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import Foundation

public class FakeAddTrackingCodeView:
    AddTrackingCodeView {

    var didSetCount = 0
    var lastErrorData: ErrorViewModel?

    public init() {}
    
    public var addTrackingCodeResultsInError: ErrorViewModel? {
        didSet {
            self.didSetCount += 1
            self.lastErrorData = addTrackingCodeResultsInError
        }
    }

}
