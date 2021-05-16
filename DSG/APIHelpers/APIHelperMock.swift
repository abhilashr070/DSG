//
//  APIHelperMock.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import Foundation


class APIHelperMock: ServicesProtocol {
    
    public static var shared = APIHelperMock()
    
    private init () {}
    
    func retrieveEvents(endPoint: EndPoint, onCompletion: @escaping (EventsModel?, Error?) -> Void) {
        let jsonData = readJSON("Events")
        do {
            let codableModel = try JSONDecoder().decode(EventsModel.self, from: jsonData)
            onCompletion(codableModel,nil)
            print("Events count:\(codableModel.events?.count ?? 0)")
        } catch let error {
            onCompletion(nil,error)
        }
    }
    
}
