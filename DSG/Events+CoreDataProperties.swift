//
//  Events+CoreDataProperties.swift
//  
//
//  Created by Abhilash on 5/15/21.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var dateTime: String?
    @NSManaged public var isFavourite: Bool

}
