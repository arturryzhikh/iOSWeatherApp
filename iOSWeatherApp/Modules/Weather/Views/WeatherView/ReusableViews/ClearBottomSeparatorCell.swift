//
//  TransparentCellWithSeparator.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit

class ClearBottomSeparatorCell: ClearCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSeparatorOf(height: 1)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSeparatorOf(height: CGFloat) {
        let line: UIView = {
            let line = UIView()
            line.backgroundColor = .weatherWhite()
            return line
        }()
        addSubviewForAutoLayout(line)
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
