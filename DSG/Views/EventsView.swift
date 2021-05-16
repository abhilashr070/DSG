//
//  EventsView.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import Foundation
import UIKit

protocol EventsViewDelegate {
    func didSelectEvent(indexPath:IndexPath)
}


class EventsView: UIView {

    var viewModel:EventsViewModel?
    var tableview = UITableView()
    var isServiceCallinProgress = false
    var delegate:EventsViewDelegate?

    init(viewModel: EventsViewModel, delegate:EventsViewDelegate) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        self.delegate = delegate
        configureView()
    }
    
    func configureView() {
        self.addSubview(tableview)
                
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 190.0
        tableview.separatorStyle = .none
        tableview.register(EventsTableViewCell.self, forCellReuseIdentifier: EventsTableViewCell.identifer)
        tableview.tableFooterView = UIView()
        tableview.keyboardDismissMode = .onDrag
        tableview.anchor(top: self.topAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leadingAnchor, paddingLeft: 0, right: self.trailingAnchor, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = bounds

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension EventsView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.getEvents().count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.identifer) as? EventsTableViewCell
        itemCell?.configureCell(event: (viewModel?.getEvents()[indexPath.row])!)
        return itemCell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let del = self.delegate {
            del.didSelectEvent(indexPath: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension EventsView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /*let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            if isServiceCallinProgress == false {
                showIndicator()
                isServiceCallinProgress = !isServiceCallinProgress
                print(" you reached end of the table")
                viewModel?.retriveEventsFromServer(searchTerm: self.viewModel?.afterIndex ,completion: {
                    self.isServiceCallinProgress = !self.isServiceCallinProgress
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                        hideIndicator()
                    }
                })
            }
            
        }*/
    }
}
