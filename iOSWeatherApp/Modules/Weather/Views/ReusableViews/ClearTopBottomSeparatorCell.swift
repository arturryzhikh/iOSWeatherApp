//
//  ClearTopBottomSeparatorCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit

class ClearTopBottomSeparatorCell: ClearBottomSeparatorCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSeparatorsOfHeight()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSeparatorsOfHeight(top: CGFloat = 1,bottom: CGFloat = 1) {
        let topline: UIView = {
            let line = UIView()
            line.backgroundColor = .white
            return line
        }()
        let bottomline: UIView = {
            let line = UIView()
            line.backgroundColor = .white
            return line
        }()
        
        addSubviewsForAutoLayout([topline,bottomline])
        NSLayoutConstraint.activate([
            topline.leadingAnchor.constraint(equalTo: leadingAnchor),
            topline.trailingAnchor.constraint(equalTo: trailingAnchor),
            topline.topAnchor.constraint(equalTo: topAnchor),
            topline.heightAnchor.constraint(equalToConstant: top),
            bottomline.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomline.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomline.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomline.heightAnchor.constraint(equalToConstant: bottom)
        ])
    }
}
