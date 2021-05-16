//
//  EventsViewModel.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import Foundation
import UIKit
import CoreData

class EventsViewModel {
    
    var selectedIndexPath:IndexPath?
    var eventsModel:EventsModel?
    var filterdEventModel:EventsModel?
    var apiHelper:ServicesProtocol = APIHelper.shared
    var evetnsArr:[Event] {
        return eventsModel?.events ?? [Event]()
    }
    var filterEvents:[Event] {
        return filterdEventModel?.events ?? [Event]()
    }
    var isSearchEnabled:Bool = false
    
    func getEvents() -> [Event] {
        if isSearchEnabled {
            if filterdEventModel == nil {
                return [Event]()
            }
            return filterEvents
        }
        if eventsModel == nil {
            return [Event]()
        }
        return evetnsArr
    }
    
    convenience init(eventsModel:EventsModel) {
        self.init()
        self.eventsModel = eventsModel
        //setEventsModel(newValue: eventsModel)
    }
    /*func setEventsModel(newValue:EventsModel) {
        self.eventsModel = newValue
    }
    func appendEventsToArray(events:[Event]) {
        evetnsArr.append(contentsOf: events)
    }
    
    var afterIndex:String {
        /*if let after = eventsModel.data?.after, after.count > 0 {
            return after
        }*/
        return ""
    }*/
    /*func updateEventsFavouriteStatus(events:[Event]) {
        let results =  getAllEventsFromDB()
        for dbEvent in results {
            var obj = events.filter{ $0.id ?? 0 == dbEvent.id }
            if obj.count > 0 {
                obj.first?.isFavourite = true
            }
        }
    }
    ! {
        didSet {
            updateEventsFavouriteStatus(events: eventsModel.events ?? [Event]())
        }
    }*/
    func retriveEventsFromServer(searchTerm:String? = "", completion: @escaping() -> Void)
    {
        let endPoint = searchTerm?.count == 0 ? EndPoint() : EndPoint(urlParameters: ["q":searchTerm!])
        
        apiHelper.retrieveEvents(endPoint: endPoint) { (model, erroe) in
            if let eventsModel = model {
                if self.isSearchEnabled {
                    self.filterdEventModel = eventsModel
                }else{
                    self.eventsModel = eventsModel
                }
                completion()
            }
            DispatchQueue.main.async {
                hideIndicator()
            }
        }
    }
    
    func getAllEventsFromDB() -> [Events] {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
        //request.predicate = NSPredicate(format: "id = %d", (self.id ?? 0))
        do {
            let result = try context.fetch(request)
            return (result as? [Events])!
        } catch  {
            print(error.localizedDescription)
            return [Events]()
        }
    }
    
}
