//
//  EndPoint.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import Foundation
enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
}
let API_CLIENT_ID = "MjE5Mjg2NDZ8MTYyMTA3MTQxOC44MDI2MzI"
class EndPoint {
    var path:String = ""
    var urlParameters:[String:Any]
    var method: HTTPMethod = HTTPMethod.get

    init(path:String? = "", urlParameters:[String:Any]? = [:], method:HTTPMethod? = .get) {
        self.path = path!
        var queryParams = urlParameters!
        queryParams["client_id"] = API_CLIENT_ID
        self.urlParameters = queryParams
        self.method = method!
    }
    
}
