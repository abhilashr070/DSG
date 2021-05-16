//
//  EventDetailsViewModel.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import Foundation
import UIKit
import CoreData

class EventDetailsViewModel {
    var event:Event?

    convenience init(event:Event) {
        self.init()
        self.event = event
    }
    var eventTitle:String {
        return event?.title ?? ""
    }
    var eventDisplayAddress:String {
        return event?.venue?.displayLocation ?? ""
    }
    var eventImage:String {
        return event?.performers?.first?.image ?? ""
    }
    var eventdateTime:String {
        return event?.datetimeLocal?.formatedDateTime ?? ""
    }
    
    
    func insertDataToEmplotee(isFavourite:Bool) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Events", in: context)!
        let eventsDBobj = NSManagedObject(entity: entity, insertInto: context) as? Events
        if let eventsObj = eventsDBobj, isFavourite == true {
            eventsObj.id = Int64(event?.id ?? 0)
            eventsObj.title = eventTitle
            eventsObj.dateTime = eventdateTime
            eventsObj.isFavourite = true
            context.insert(eventsObj)
        }else{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
            request.predicate = NSPredicate(format: "id = %d", (event?.id ?? 0))
            let result = try? context.fetch(request) as! [Events]
            if let firstObj = result?.first as? Events {
                context.delete(firstObj)
            }
        }
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
        }
        
    }
    
    
}
