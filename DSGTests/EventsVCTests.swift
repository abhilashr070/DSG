//
//  EventsVCTests.swift
//  DSGTests
//
//  Created by Abhilash on 5/15/21.
//

import UIKit
import XCTest
@testable import DSG

class EventsVCTests: XCTestCase {
    
    var subject:EventsVC!
    var viewModel = EventsViewModel()
    override func setUp() {
        
        viewModel.apiHelper = APIHelperMock.shared
        let jsonData = readJSON("Events")
        let codableModel = try? JSONDecoder().decode(EventsModel.self, from: jsonData)
        if let model = codableModel {
            viewModel = EventsViewModel(eventsModel: model)
            subject = EventsVC(vm: viewModel)
        }
        subject.viewDidLoad()
        subject.loadView()
        
    }
    
    
    func testViewController(){
        XCTAssertNotNil(subject)
        XCTAssertNotNil(subject.view)
        
    }
    func testSearchControllerMethods(){
        XCTAssertNotNil(subject.searchBarTextDidBeginEditing(UISearchBar()))
        XCTAssertNotNil(subject.searchBarTextDidEndEditing(UISearchBar()))
        XCTAssertNotNil(subject.searchBarCancelButtonClicked(UISearchBar()))
        XCTAssertNotNil(subject.searchBarSearchButtonClicked(UISearchBar()))
        XCTAssertEqual(subject.textFieldShouldClear(UITextField()), true)
        XCTAssertNotNil(subject.updateTableViewContent())
        
        
        let indexPath = IndexPath(row: 0, section: 0)
        XCTAssertNotNil(subject.didSelectEvent(indexPath: indexPath))

        viewModel.selectedIndexPath = IndexPath(row: 0, section: 0)
        XCTAssertNotNil(subject.didSelectFavourite())
    }
    
    func testEventsViewProperties()
    {
        subject.eventsView.layoutSubviews()
        XCTAssertNotNil(subject.eventsView.layoutSubviews())
        XCTAssertNotNil(subject.eventsView)
        XCTAssertNotNil(subject.eventsView.viewModel)
        XCTAssertEqual(subject.eventsView.isServiceCallinProgress, false)
        XCTAssertNotNil(subject.eventsView.configureView())
        
        
        let numberOfRwos = subject.eventsView.tableView(subject.eventsView.tableview, numberOfRowsInSection: 0)
        XCTAssertEqual(subject.viewModel?.evetnsArr.count, numberOfRwos)

        let cell:EventsTableViewCell = subject.eventsView.tableView(subject.eventsView.tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as! EventsTableViewCell
        XCTAssertNotNil(cell)
        let firstItem = viewModel.evetnsArr[0]
        cell.configureCell(event: firstItem)
        XCTAssertNotNil(cell.itemTitle)
        XCTAssertEqual(cell.itemTitle.text, firstItem.title)
        XCTAssertNotNil(cell.itemImageView)
    }

}
