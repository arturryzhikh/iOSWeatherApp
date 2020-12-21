//
//  ClearTopBottomSeparatorCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit

public class ClearTopBottomSeparatorCell: ClearCell {
    private let topline: UIView = {
        let line = UIView()
        line.backgroundColor = .weatherWhite()
        return line
    }()
    private let bottomline: UIView = {
        let line = UIView()
        line.backgroundColor = .weatherWhite()
        return line
    }()
    override func initialSetup() {
        super.initialSetup()
        addSubviewsForAutoLayout([topline,bottomline])
        NSLayoutConstraint.activate([
            topline.leadingAnchor.constraint(equalTo: leadingAnchor),
            topline.trailingAnchor.constraint(equalTo: trailingAnchor),
            topline.topAnchor.constraint(equalTo: topAnchor),
            topline.heightAnchor.constraint(equalToConstant: 1),
            bottomline.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomline.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomline.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
