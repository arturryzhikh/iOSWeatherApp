//
//  TestFooter.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class TodayFooter: DataCell {
    
    static var defaultHeight: CGFloat {
        Screen.height * 0.143
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        //FIXME: move method to point when view model is available
        populateSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private let locationLabel: UILabel = {
        let lbl = UILabel(transparentText: false,font: .locationLabel)
        return lbl
    }()
    
    //MARK:Instance methods
    
    private func addConstraints() {
        addSubviewsForAutoLayout([locationLabel])
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Screen.statusBarHeight),
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
    private func populateSubviews() {
        locationLabel.text = "Section 0 Footer"
        
    }
    
    
    
}
