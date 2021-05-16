//
//  APIHelper.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import Foundation

let EVENTS_BASE_URL = "https://api.seatgeek.com/2/events"//&q=swift"
//https://api.seatgeek.com/2/events?client_id=MjE5Mjg2NDZ8MTYyMTA3MTQxOC44MDI2MzI&q=swift
typealias completionHandler = (Bool,Any?) -> Void

protocol ServicesProtocol {
    func retrieveEvents(endPoint: EndPoint, onCompletion: @escaping(_ model: EventsModel? , _ error:Error?) -> Void)
}

class APIHelper: ServicesProtocol {
    public static var shared = APIHelper()
    
    private init () {}
    
    func retrieveEvents(endPoint: EndPoint, onCompletion: @escaping (EventsModel?, Error?) -> Void) {
        self.get(endPoint: endPoint) { (isSuccess, jsonData) in
            if let error = jsonData as? Error {
                onCompletion(nil,error)
                return
            }
            if let dataObj = jsonData as? Data{
                do {
                    let codableModel = try JSONDecoder().decode(EventsModel.self, from: dataObj)
                    onCompletion(codableModel,nil)
                } catch let error {
                    print(error)
                    print(error.localizedDescription)
                    onCompletion(nil,error)
                }
            }
        }
    }
    
    func get(endPoint:EndPoint, compleationHandler:@escaping completionHandler ) {
        
        var url = URL(string: EVENTS_BASE_URL + (endPoint.path.count > 0 ? endPoint.path : ""))!
        if endPoint.urlParameters.count > 0 {
            let queryItems = endPoint.urlParameters.map {
                return URLQueryItem(name: "\($0)", value: "\($1)")
            }
            var urlComponents = URLComponents(url: url , resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = queryItems
            url = urlComponents?.url ?? url
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        print("GET request:\(request)");
        URLSession.shared.dataTask(with: request) { data, response, error in
            self.validateResponse(data: data, response: response, error: error) { (isSuccess, jsonData) in
                compleationHandler(isSuccess,jsonData)
            }
        }.resume()
    }
    private func validateResponse(data:Data?, response:URLResponse?, error:Error?, compleationHandler:@escaping completionHandler ) {

        if !(response?.isSuccessStausCode ?? false) || error != nil {
            /*if let jsonData = try? JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String:Any] {
                print("Error with JSON \(jsonData)")
                compleationHandler(false,jsonData)
                return
            }*/
            if let err = error {
                compleationHandler(false,err)
                return
            }
        }

        guard let data = data else {
            compleationHandler(false,error)
            return
        }
        compleationHandler(true,data)
    }
    
}
extension URLResponse {
    
    var isSuccessStausCode:Bool {
       if let httpResponse = self as? HTTPURLResponse {
            return (200...299).contains(httpResponse.statusCode)
        }
        return false
    }

}
