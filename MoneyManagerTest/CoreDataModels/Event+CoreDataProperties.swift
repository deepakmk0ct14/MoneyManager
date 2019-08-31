//
//  Event+CoreDataProperties.swift
//  
//
//  Created by Deepak on 8/31/19.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var header: String?
    @NSManaged public var subheader: String?
    @NSManaged public var startdate: NSDate?

}
