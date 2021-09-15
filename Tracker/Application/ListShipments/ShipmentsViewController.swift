//
//  ShipmentsViewController.swift
//  ShipmentsTracker
//
//  Created by Iorgers Almeida on 26/06/21.
//

import UIKit
import SwiftUI
import ShipmentsTrackerAdapters

class ShipmentsViewController:
    UITableViewController,
    AddTrackingCodeView,
    ListShipmentsView{

    var addTrackingCodeResultsInError: ErrorViewModel? {
        didSet {
            self.handleTrackingCodeAddedResult()
        }
    }

    var shipmentsViewModel: [ShipmentDetailsViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    var addTrackingCodeController: AddTrackingCodeController?
    var listShipmentsController: ListShipmentsController?
    var router: Router?

    private func handleTrackingCodeAddedResult() -> () {
        if(self.addTrackingCodeResultsInError == nil){
            self.updateShipmentsList()
        }else{
            self.onAddTrackincCodeResultError()
        }
    }

    private func updateShipmentsList() {
        self.listShipmentsController?.handle(request: .nonArchived)
    }

    override func viewDidLoad() {
        self.updateShipmentsList()
    }

    private func onAddTrackincCodeResultError(){

        guard
            let error = self.addTrackingCodeResultsInError
        else {
            self.updateShipmentsList()
            return
        }

        self.showAlert(error)
    }

    private func showAlert(_ error: ErrorViewModel) {
        let alert = UIAlertController(
            title: error.title,
            message: error.message,
            preferredStyle: UIAlertController.Style.alert)

        alert.addAction(
            UIAlertAction(
                title: "Click",
                style: UIAlertAction.Style.default,
                handler: nil))

        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedShipment = self.shipmentsViewModel[indexPath.row]

        //MARK: Invoke the router here

        guard
            let router = self.router as? MyRouter
        else {
            return
        }

        router.showDetails(for: selectedShipment, into: self)

        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension ShipmentsViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.shipmentsViewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ShipmentCell", for: indexPath) as! ShipmentCell

        cell.shipmentInfo = self.shipmentsViewModel[indexPath.row]

        return cell
    }
}

extension ShipmentsViewController{

    @IBAction func cancelToShipmentsViewController(_ segue: UIStoryboardSegue){}

    @IBAction func addTrackingCode(_ segue: UIStoryboardSegue){
        guard
              let addTrackingCodeViewController = segue.source as? AddTrackingCodeViewController,
              let trackingCode = addTrackingCodeViewController.trackingCodeTextField.text
        else { return }

        let identifier = addTrackingCodeViewController.identifierTextField.text

        self.addTrackingCodeController?.handle(trackingCode: trackingCode, identifier: identifier)
    }

}
