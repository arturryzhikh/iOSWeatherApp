//
//  ExtendedInfoCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit

final class DetailCell: ClearCell , Reusable {
   
    var viewModel: DetailCellVM? {
        
        didSet {
            if let vm = viewModel {
                populateSubviews(with: vm)
            }
        }
    }
    func populateSubviews(with viewModel: DetailCellVM) {
        detailLabel.text = viewModel.detail
        valueLabel.text = viewModel.value
    }
    //MARK: Other properties
    
    //MARK: Subviews
    let detailLabel: UILabel = {
        return $0
    }(UILabel(transparentText: true, alignment: .left, font: .extendedInfoTitle))
    
    private let valueLabel: UILabel = {
        return $0
    }(UILabel(transparentText: false, alignment: .left, font: .extendedInfoValue))
    
    //MARK: life Cycle
    override func setup() {
        super.setup()
        addSubviewForAutoLayout(vStack)
        activateConstraints()
        addSeparator(to: .top, aboveSubview: valueLabel)
        
        
        
    }
    
    
    private lazy var vStack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 0
        return $0
        
    }(UIStackView(arrangedSubviews:[detailLabel, valueLabel]))
    
    
    override func activateConstraints() {
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
}

