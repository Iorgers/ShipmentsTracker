//
//  AddTrackingCodeResult.swift
//  Domain
//
//  Created by Iorgers Almeida on 10/09/21.
//

import Foundation

public protocol AddTrackingCodeResult: AnyObject{
    func addTrackingCodeSucess() -> Void
    func addTrackingCodeInvalid() -> Void
    func addTrackingCodeNotFound() -> Void
    func addTrackingCodeDuplicated() -> Void
    func addTrackingCodeNoResponse() -> Void
}
