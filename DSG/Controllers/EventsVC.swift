//
//  EventsVC.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import UIKit
import MBProgressHUD

class EventsVC: UIViewController {

    var viewModel:EventsViewModel?
    
    var eventsView:EventsView {
        return self.view as! EventsView
    }
    convenience init(vm: EventsViewModel) {
        self.init()
        self.viewModel = vm
    }
    override func loadView() {
        self.view = EventsView(viewModel: self.viewModel!, delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        addSearchBar()
        
        loadItemsFromServer()
    }
    func addSearchBar() {

        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 32))
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search by name"
        searchBar.searchTextField.backgroundColor = UIColor(red: 1.0/255.0, green: 8.0/255.0, blue: 18.0/225.0, alpha: 1)
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.delegate = self
        searchBar.autocorrectionType = .no
        searchBar.spellCheckingType = .no
        searchBar.delegate = self
        searchBar.tintColor = .white
        self.navigationItem.titleView = searchBar
    }
    func loadItemsFromServer(searchTerm:String? = "") {
        
        showIndicator()
        viewModel?.retriveEventsFromServer(searchTerm:searchTerm, completion: {
            DispatchQueue.main.async {
                //self.eventsView.tableview.beginUpdates()
                //self.eventsView.tableview.reloadSections(IndexSet(arrayLiteral: 0), with: .none)
                self.eventsView.tableview.reloadData()
                //self.eventsView.tableview.endUpdates()
                hideIndicator()
            }
        })
    }
}

extension EventsVC : UISearchBarDelegate, UITextFieldDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel?.isSearchEnabled = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        updateTableViewContent()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        loadItemsFromServer(searchTerm: searchBar.text)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateTableViewContent()
        return true
    }
    func updateTableViewContent(){
        viewModel?.isSearchEnabled = false
        loadItemsFromServer()
    }
}


extension EventsVC : EventsViewDelegate {
    func didSelectEvent(indexPath: IndexPath) {
        if indexPath.row > viewModel?.getEvents().count ?? 0 {
            return
        }
        if let event = viewModel?.getEvents()[indexPath.row]  {
            viewModel?.selectedIndexPath = indexPath
            let detailsVC = EventDetailsVC(vm: EventDetailsViewModel(event: event), delegate: self)
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
extension EventsVC : EventDetailsVCDelegate {
    func didSelectFavourite() {
        if let indexPath = viewModel?.selectedIndexPath {
            self.eventsView.tableview.reloadData()
            //self.eventsView.tableview.reloadRows(at: [indexPath], with: .none)
        }
    }
}
