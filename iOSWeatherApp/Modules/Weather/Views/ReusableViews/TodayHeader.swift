//
//  TestHeader.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class TodayHeader: DataCell {
    //MARK: Static  Properties
    static var defaultHeight: CGFloat {
        Screen.height * 0.453
    }
    static var minimumHeight: CGFloat {
        Screen.height * 0.143
    }
    //MARK: Other Properties
    private var computedAlpha: CGFloat {
        let transparentY = temperatureLabel.frame.height + temperatureLabel.frame.origin.y
        return max((frame.height - transparentY) / (TodayHeader.defaultHeight - transparentY), 0)
    }
    //MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        //FIXME: move method to point when view model is available
        populateSubviews()
        
    }
    override func layoutSubviews() {
        highLowLabel.alpha = computedAlpha
        temperatureLabel.alpha = computedAlpha
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Subviews
    private lazy var vStack: UIStackView = {
        let subviews = [locationLabel,
                        shortForcastLabel,
                        temperatureLabel,
                        highLowLabel]
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()
    private let locationLabel: UILabel = {
        let lbl = UILabel(transparentText: false,font: .locationLabel)
        return lbl
    }()
    private let shortForcastLabel: UILabel = {
        let lbl = UILabel(font: .shortForcastLabel)
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel(font: .temperatureLabel)
        return lbl
    }()
    private let highLowLabel: UILabel = {
        let lbl = UILabel(font: .highLowLabel)
        return lbl
    }()
    //MARK:Instance methods
    private func setup() {
        clipsToBounds = true
        addConstraints()
    }
    private func addConstraints() {
        addSubviewsForAutoLayout([vStack])
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: self.topAnchor, constant: Screen.statusBarHeight),
            vStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
    private func populateSubviews() {
        locationLabel.text = "Сосенское"
        shortForcastLabel.text = "Переменная облачность"
        temperatureLabel.text = "25"
        highLowLabel.text = "H: 12° L: -5°"
    }
    
    
}
