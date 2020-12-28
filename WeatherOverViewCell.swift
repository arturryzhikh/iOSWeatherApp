//
//  WeatherOverViewCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit

final class WeatherOverViewCell: ClearCell {
 
   //MARK: Subviews
    private let overViewTextView: UITextView = {
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
        return tv
    }()
    //MARK: Life cycle
    override func setup() {
        super.setup()
        addSubviewForAutoLayout(overViewTextView)
        addSeparator(to: .top, aboveSubview: overViewTextView)
        activateConstraints()
    }
    //MARK: Instance methods
    override func activateConstraints() {
        NSLayoutConstraint.activate([
            overViewTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overViewTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overViewTextView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
   
    
}
