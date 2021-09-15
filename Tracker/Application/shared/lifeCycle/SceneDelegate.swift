//
//  SceneDelegate.swift
//  Tracker
//
//  Created by Iorgers Almeida on 15/09/21.
//

import UIKit
import SwiftUI
import ShipmentsTrackerAdapters
import ShipmentsTrackerCore

protocol ShowDetailsView {
    var detailsViewModel: ShipmentViewModel { get set }
}

protocol Router: AnyObject{
    func showListShipments(with data: ListShipmentsView)
    func showDetails(for trackingCode: String)
}

class MyRouter: Router {

    let rootVC: UIViewController

    init(_ vc: UIViewController){
        self.rootVC = vc
    }

    func showListShipments(with data: ListShipmentsView) {
        //var content = ListShipmentsContent(data: data as! ObservableListShipments)
        //content.router = self
        //let controller = UIHostingController(rootView: content)
        //rootVC.show(controller, sender: self)
    }

    func showDetails(for trackingCode: String) {


        let viewModel = ShipmentDetailsViewModel.example

        let content = ShowShipmentDetailsUIView(viewModel)
        let controller = UIHostingController(rootView: content)

        self.rootVC.present(controller, animated: true, completion: {})

        //self.rootVC.show(controller, sender: self)
    }

    func showDetails(for trackingCode: String, into viewController: UIViewController) {


        let viewModel = ShipmentDetailsViewModel.example

        let content = ShowShipmentDetailsUIView(viewModel)
        let controller = UIHostingController(rootView: content)

        viewController.show(controller, sender: self)

        //self.rootVC.show(controller, sender: self)
    }

    func showDetails(for shipmentViewModel: ShipmentDetailsViewModel, into viewController: UIViewController) {

        let content = ShowShipmentDetailsUIView(shipmentViewModel)
        let controller = UIHostingController(rootView: content)

        viewController.show(controller, sender: self)

        //self.rootVC.show(controller, sender: self)
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }

        //Bad way of getting the view controller reference?
        guard let shipmentsViewController =
            window?.rootViewController?.children.first?.children.first as? ShipmentsViewController else { return }

        let router = MyRouter(window!.rootViewController!)

        //let repository = InMemoryShipmentsRepository()

        let repository = ShipmentsRepositoryLogDecorator(InMemoryShipmentsRepository())

        repository.add(ShipmentDetails.Examples.first!)

        repository.add(ShipmentDetails(for: "asdf"))

        let gateway = FakeShipmentDetailsGateway()

        let presenter = ListShipmentsPresenterToView(shipmentsViewController)

        let fakeService = ListShipmentServiceImpl(
            repository,
            presenter
        )

        let listController = ListShipmentsControllerImpl(fakeService)

        shipmentsViewController.listShipmentsController = listController

        let addPresenter = AddTrackingCodePresenter(shipmentsViewController)

        let addService = AddTrackingCodeServiceImpl(repository, gateway, addPresenter)

        let addController = AddTrackingCodeControllerImpl(addService)

        shipmentsViewController.addTrackingCodeController = addController

        shipmentsViewController.router = router


        //let viewsFactory = ViewsFactoryImpl(shipmentsViewController, shipmentsViewController)
        //let controllersFactory = getControllersFactory(viewsFactory)

        //shipmentsViewController.listShipmentsController = controllersFactory.createListShipmentsController()

        //shipmentsViewController.addTrackingCodeController = controllersFactory.createAddTrackingCodeController()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
