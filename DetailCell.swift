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
        let lbl = UILabel(transparentText: true, alignment: .left, font: .extendedInfoTitle)
        return lbl
    }()
    private let valueLabel: UILabel = {
        let lbl = UILabel(transparentText: false, alignment: .left, font: .extendedInfoValue)
        return lbl
    }()
    //MARK: life Cycle
    override func setup() {
        super.setup()
        addSubviewForAutoLayout(vStack)
        activateConstraints()
        addSeparator(to: .top, aboveSubview: valueLabel)
        
        
        
    }
    private lazy var vStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews:[detailLabel, valueLabel])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fillProportionally
        sv.spacing = 0
        return sv
        
    }()
    override func activateConstraints() {
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
}

