//
//  EventDetailsVC.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import UIKit

protocol EventDetailsVCDelegate {
    func didSelectFavourite()
}


class EventDetailsVC: UIViewController {

    var viewModel:EventDetailsViewModel?
    var delegate:EventDetailsVCDelegate?
    var detailsView:EventDetailsView {
        return self.view as! EventDetailsView
    }
    convenience init(vm: EventDetailsViewModel, delegate:EventDetailsVCDelegate) {
        self.init()
        self.viewModel = vm
        self.delegate = delegate
    }
    override func loadView() {
        self.view = EventDetailsView(viewModel: self.viewModel!, delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"

    }

}

extension EventDetailsVC : EventDetailsViewDelegate {
    func didAddFaviorite() {
        self.delegate?.didSelectFavourite()
    }
    
}
