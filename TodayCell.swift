//
//  WeatherOverViewCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit

final class TodayCell: ClearCell, Reusable {
    
    
    func populateSubviews(with viewModel: TodayCellVM) {
        todayTxtView.text = viewModel.overview
    }
    
   
    var viewModel: TodayCellVM? {
        didSet {
            if let vm = viewModel {
                
                populateSubviews(with: vm)
            }
           
        }
    }
    
    //MARK: Subviews
    private let todayTxtView: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .left
        tv.font = .overView
        tv.textColor = .weatherWhite
        tv.backgroundColor = .clear
        tv.isScrollEnabled = false
        tv.isUserInteractionEnabled = false
        tv.textContainerInset = .zero
        tv.textContainer.maximumNumberOfLines = 4
        tv.textContainer.lineFragmentPadding = 0
        tv.textContainer.lineBreakMode = .byWordWrapping
        return tv
    }()
    //MARK: Life cycle
    override func setup() {
        super.setup()
        addSubviewForAutoLayout(todayTxtView)
        addSeparator(to: .top, aboveSubview: todayTxtView)
        activateConstraints()
        
    }
    //MARK: Instance methods
    override func activateConstraints() {
        NSLayoutConstraint.activate([
            todayTxtView.leadingAnchor.constraint(equalTo: leadingAnchor),
            todayTxtView.trailingAnchor.constraint(equalTo: trailingAnchor),
            todayTxtView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
   
    
}
