//
//  CoreDataShipmentsRepository.swift
//  Tracker
//
//  Created by Iorgers Almeida on 17/09/21.
//

import Foundation
import CoreData
import ShipmentsTrackerCore

class CoreDataShipmentsRepository:
    ShipmentsRepository {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ShipmentsModels")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    var viewContext: NSManagedObjectContext {
        self.persistentContainer.viewContext
    }

    public init() {}

    func get(for trackingCode: String) -> ShipmentDetails? {

        do {
            guard
                let shipment = try getShipmentFromViewContext(for: trackingCode)
            else {
                return nil
            }

            return self.getShipmentDetails(from: shipment)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func add(_ shipmentDetails: ShipmentDetails) {

        let _ = createShipment(from: shipmentDetails, viewContext: viewContext)

        do { try viewContext.save() } catch { fatalError(error.localizedDescription) }
    }

    func list() -> [ShipmentDetails] {

        do {
            let shipments = try getShipmentsFromViewContext()
            return getShipmentsDetails(from: shipments)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func update(_ shipmentDetails: ShipmentDetails) {

        let trackingCode = shipmentDetails.trackingCode.code

        let shipment = try! getShipmentFromViewContext(for: trackingCode)!

        shipment.archived = shipmentDetails.archived
        shipment.finished = shipmentDetails.finished
        shipment.identifier = shipmentDetails.trackingCode.identifier

        shipment.shipmentSteps = nil

        shipmentDetails.trackingDetails.forEach({
            let step = getShipmentStep(from: $0, viewContext: viewContext)
            shipment.addToShipmentSteps(step)
        })

        do { try viewContext.save() } catch { fatalError(error.localizedDescription) }
    }

    //MARK: CoreData sorting function

    func getShipmentsStepsSortedByDate(_ shipment: Shipment) -> [ShipmentStep] {

        let sortByDate = NSSortDescriptor(
            keyPath: \ShipmentStep.timeStamp,
            ascending: false)

        let shipmentsSteps = shipment.shipmentSteps?
            .sortedArray(using: [sortByDate]) as? [ShipmentStep] ?? []

        return shipmentsSteps
    }

    //MARK: CoreData data access

    func getShipmentFromViewContext(for trackingCode: String) throws -> Shipment? {
        let requestForTrackingCode = Shipment.fetchRequest(for: trackingCode)
        let result = try viewContext.fetch(requestForTrackingCode) as [Shipment]
        return result.first
    }

    func getShipmentsFromViewContext() throws -> [Shipment] {
        let requestForAll: NSFetchRequest<Shipment> = Shipment.fetchRequest()
        return try viewContext.fetch(requestForAll) as [Shipment]
    }

    //MARK: Mapping functions

    func getShipmentsDetails(from shipments: [Shipment]) -> [ShipmentDetails] {
        shipments.map({ shipment in
                          getShipmentDetails(from: shipment)
                      }) as [ShipmentDetails]
    }

    func getShipmentDetails(from shipment: Shipment) -> ShipmentDetails {

        let shipmentsSteps = getShipmentsStepsSortedByDate(shipment)

        let steps = shipmentsSteps.map({ step in createTrackingStep(from: step) })

        return ShipmentDetails(
            for: TrackingCode(with: shipment.trackingCode!, using: shipment.identifier),
            with: steps,
            archived: shipment.archived,
            finished: shipment.finished)
    }

    func getShipmentStep(
        from trackingStep: TrackingStep,
        viewContext: NSManagedObjectContext) -> ShipmentStep {
            let step = ShipmentStep(context: viewContext)

            step.currentlyIn = trackingStep.currentlyIn
            step.timeStamp = trackingStep.timeStamp
            step.timeZone = trackingStep.timeZone?.abbreviation()
            step.status = trackingStep.status
            step.sentTo = trackingStep.sentTo

            return step
    }

    func createTrackingStep(from step: ShipmentStep) -> TrackingStep {
        TrackingStep(
            currentlyIn: step.currentlyIn!,
            timeStamp: step.timeStamp!,
            timeZone: TimeZone(abbreviation: step.timeZone ?? ""),
            sentTo: step.sentTo,
            status: step.status!)
    }

    func createShipment(
        from shipmentDetails: ShipmentDetails,
        viewContext: NSManagedObjectContext) -> Shipment {

            let shipment = Shipment(context: viewContext)

            shipment.archived = shipmentDetails.archived
            shipment.finished = shipmentDetails.finished
            shipment.identifier = shipmentDetails.trackingCode.identifier
            shipment.trackingCode = shipmentDetails.trackingCode.code

            shipmentDetails.trackingDetails.forEach { trackingStep in
                let step = getShipmentStep(
                    from: trackingStep,
                    viewContext: viewContext)

                shipment.addToShipmentSteps(step)
            }

            return shipment

    }

}
