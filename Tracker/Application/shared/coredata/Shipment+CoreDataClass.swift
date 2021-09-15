//
//  Shipment+CoreDataClass.swift
//  Tracker
//
//  Created by Iorgers Almeida on 17/09/21.
//
//

import Foundation
import CoreData

@objc(Shipment)
public class Shipment: NSManagedObject {

    public static func fetchRequest(for trackingCode: String)
        -> NSFetchRequest<Shipment> {
        let fetch: NSFetchRequest = Shipment.fetchRequest()
        fetch.predicate = NSPredicate(format: "trackingCode == %@", trackingCode)
        return fetch
    }

}
