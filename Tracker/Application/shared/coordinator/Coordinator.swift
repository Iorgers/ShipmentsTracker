//
//  ViewCoordinator.swift
//  Tracker
//
//  Created by Iorgers Almeida on 16/10/21.
//

import Foundation

typealias FinishHandler = (ManagedCoordinator) -> ()

typealias ViewCoordinator = ManagedCoordinator & CoordinatorManager

protocol BaseCoordinator: AnyObject {
    func start()
}

protocol ManagedCoordinator: BaseCoordinator {
    var parent: CoordinatorManager? { get set }
    func finish() -> Void
}

extension ManagedCoordinator {
    func finish() {
        self.parent?.removeChild(self)
    }
}

class CoordinatorManager: BaseCoordinator {

    var children = [ManagedCoordinator]()

    public func addChild(_ coordinator: ManagedCoordinator){
        coordinator.parent = self
        self.children.append(coordinator)
    }

    public func removeChild(_ coordinator: ManagedCoordinator){
        self.children = children.filter({ $0 !== coordinator })
    }

    func start() {
        preconditionFailure("start() must be overriden")
    }

}

import UIKit

class Coordinator: ViewCoordinator {
    var parent: CoordinatorManager?
    var rootViewController: UIViewController

    init(_ root: UIViewController){
        self.rootViewController = root
    }
}
