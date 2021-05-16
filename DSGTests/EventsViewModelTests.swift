//
//  EventsViewModelTests.swift
//  DSGTests
//
//  Created by Abhilash on 5/15/21.
//

import XCTest
@testable import DSG

class EventsViewModelTests: XCTestCase {
    
    var viewModel = EventsViewModel()
    
    override func setUp() {
        super.setUp()
        viewModel.apiHelper = APIHelperMock.shared
        let jsonData = readJSON("Events")
        let codableModel = try? JSONDecoder().decode(EventsModel.self, from: jsonData)
        if let model = codableModel {
            viewModel = EventsViewModel(eventsModel: model)
        }
    }
    func testViewModelFunctions() {
        XCTAssertNotNil(viewModel)
        //XCTAssertNotNil(viewModel.afterIndex)
        XCTAssertGreaterThan(viewModel.evetnsArr.count, 0)
        
    }
    func testAPIMethods() {
        viewModel.retriveEventsFromServer(searchTerm: "") {
            XCTAssertGreaterThan(self.viewModel.evetnsArr.count, 0)
        }
    }

}
