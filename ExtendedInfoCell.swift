//
//  ExtendedInfoCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit

final class ExtendedInfoCell: ClearCell, Customizable {
    
 
    
    //MARK: Other properties
  
    //MARK: Subviews
    let infoTitleLabel: UILabel = {
        let lbl = UILabel(transparentText: true, alignment: .left, font: .extendedInfoTitle)
        return lbl
    }()
    private let infoValueLabel: UILabel = {
        let lbl = UILabel(transparentText: false, alignment: .left, font: .extendedInfoValue)
        return lbl
    }()
   //MARK: life Cycle
    override func setup() {
        addSubviewForAutoLayout(vStack)
        setupConstraints()
        addSeparator(to: .top, aboveSubview: infoValueLabel)
        
        
      
    }
    private lazy var vStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews:[infoTitleLabel, infoValueLabel])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fillProportionally
        sv.spacing = 0
        return sv
        
    }()
    func setupConstraints() {
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
  
}

