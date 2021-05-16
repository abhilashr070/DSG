//
//  EventDetailsView.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import UIKit

protocol EventDetailsViewDelegate {
    func didAddFaviorite()
}

class EventDetailsView: UIView {

    var viewModel:EventDetailsViewModel?
    var delegate:EventDetailsViewDelegate?
    
    var itemTitle:UILabel = UILabel()
    var itemImageView:UIImageView = UIImageView()
    var favouriteBtn = UIButton(type: .custom)
    
    var cityLabel:UILabel = UILabel()
    var dateTimeLabel:UILabel = UILabel()

    init(viewModel: EventDetailsViewModel, delegate:EventDetailsViewDelegate) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        self.delegate = delegate
        configureView()
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.backgroundColor = .white
        self.addSubview(itemTitle)
        self.addSubview(favouriteBtn)
        self.addSubview(itemImageView)
        self.addSubview(dateTimeLabel)
        self.addSubview(cityLabel)
        
        favouriteBtn.anchor(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 15, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: self.trailingAnchor, paddingRight: 10, centerX: nil, centerY: nil, width: 22, height:22)
        favouriteBtn.setImage(UIImage(named: "heart"), for: .normal)
        favouriteBtn.setImage(UIImage(named: "heart_filled"), for: .selected)
        favouriteBtn.addTarget(self, action: #selector(addEventAsFavurite(button:)), for: .touchUpInside)
        
        
        itemTitle.anchor(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 15, bottom: nil, paddingBottom: 0, left: self.leadingAnchor, paddingLeft: 20, right: favouriteBtn.trailingAnchor, paddingRight: 20, centerX: nil, centerY: nil, width: 0, height: 0)
        itemTitle.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        itemTitle.numberOfLines = 0

        
        itemImageView.anchor(top: itemTitle.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: self.leadingAnchor, paddingLeft: 20, right: self.trailingAnchor, paddingRight: 20, centerX: nil, centerY: nil, width: 0, height: 0)
        itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor, multiplier: 1.0/2.0).isActive = true

        dateTimeLabel.anchor(top: itemImageView.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: itemTitle.leadingAnchor, paddingLeft: 0, right: itemImageView.trailingAnchor, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 20)

        cityLabel.anchor(top: dateTimeLabel.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: itemTitle.leadingAnchor, paddingLeft: 0, right: itemImageView.trailingAnchor, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 25)
        
        itemTitle.font = UIFont.boldSystemFont(ofSize: 22)
        dateTimeLabel.font = UIFont.boldSystemFont(ofSize: 22)
        cityLabel.font = UIFont.systemFont(ofSize: 16)


    }
    func updateUI() {
        itemTitle.text = viewModel?.eventTitle
        itemImageView.sd_setImage(with: URL(string: viewModel?.eventImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        cityLabel.text = viewModel?.eventDisplayAddress
        dateTimeLabel.text = viewModel?.eventdateTime
        favouriteBtn.isSelected = viewModel?.event?.isFavouriteExistsInDB() ?? false
    }
    @objc func addEventAsFavurite(button:UIButton) {
        favouriteBtn.isSelected = !favouriteBtn.isSelected
        viewModel?.insertDataToEmplotee(isFavourite: favouriteBtn.isSelected)
        self.delegate?.didAddFaviorite()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = bounds

    }

}
