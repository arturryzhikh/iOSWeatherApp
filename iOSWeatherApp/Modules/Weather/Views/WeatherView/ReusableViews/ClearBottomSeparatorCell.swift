//
//  TransparentCellWithSeparator.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit

class ClearBottomSeparatorCell: ClearCell {
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .weatherWhite()
        return line
    }()
    override func initialSetup() {
        super.initialSetup()
        addSubviewForAutoLayout(line)
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
   
}
