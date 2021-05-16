//
//  EventDetailsVCTests.swift
//  DSGTests
//
//  Created by Abhilash on 5/15/21.
//

import UIKit
import XCTest
@testable import DSG

class EventDetailsVCTests: XCTestCase {
    
    var subject:EventDetailsVC!
    var viewModel = EventDetailsViewModel()
    override func setUp() {
        let vm = EventsViewModel()
        vm.apiHelper = APIHelperMock.shared
        let jsonData = readJSON("Events")
        let codableModel = try? JSONDecoder().decode(EventsModel.self, from: jsonData)
        if let model = codableModel {
            if let events =  model.events {
                viewModel = EventDetailsViewModel(event: events.first!)
                subject = EventDetailsVC(vm: viewModel, delegate: self)
            }
        }
        subject.viewDidLoad()
        subject.loadView()
        
    }
    
    
    func testViewController(){
        XCTAssertNotNil(viewModel)

        XCTAssertNotNil(subject)
        XCTAssertNotNil(subject.detailsView)
        
        XCTAssertNotNil(viewModel.eventTitle)
        XCTAssertNotNil(viewModel.eventImage)
        XCTAssertNotNil(viewModel.eventdateTime.formatedDateTime)
        XCTAssertNotNil(viewModel.eventDisplayAddress)
    }
}
extension EventDetailsVCTests: EventDetailsVCDelegate {
    func didSelectFavourite() {
        
    }
}
    
