//
//  TestHeader.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

class TodayHeader: UICollectionViewCell {
    //MARK: Static  Properties
    static var defaultHeight: CGFloat {
        Screen.height * 0.453
    }
    static var minimumHeight: CGFloat {
        Screen.height * 0.143
    }
    
    //MARK: Other Properties
    var topConstraint: NSLayoutConstraint?
    //MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override func layoutSubviews() {
        topConstraint?.constant = Screen.statusBarHeight
        highLowLabel.alpha = computeAlpha()
        temperatureLabel.alpha = computeAlpha()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Subviews
    private lazy var vStack: UIStackView = {
        let subviews = [locationLabel,
                        shortForcast,
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
        let lbl = UILabel()
        lbl.text = "Coceнское"
        lbl.backgroundColor = .blue
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.045).rounded(), weight: .regular)
        lbl.textColor = .white
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let shortForcast: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .cyan
        lbl.textColor = .white
        lbl.text = "Переменная облачность"
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .light)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.backgroundColor = .brown
        lbl.text = "9"
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.111).rounded(),weight: .regular)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let highLowLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .red
        lbl.textColor = .white
        lbl.text = "H: 12° L: -5°"
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.02).rounded(),weight: .light)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    //MARK:Instance methods
    private func computeAlpha() -> CGFloat {
        let transparentY = temperatureLabel.frame.height + temperatureLabel.frame.origin.y
        return max((frame.height - transparentY) / (TodayHeader.defaultHeight - transparentY), 0)
    }
    
    private func setupViews() {
        addSubviewsForAutoLayout([vStack])
        clipsToBounds = true
        addConstraints()
    }
    private func addConstraints() {
        let topPadding = frame.size.height * 0.25
        topConstraint = vStack.topAnchor.constraint(equalTo: self.topAnchor, constant: Screen.statusBarHeight)
        topConstraint?.isActive = true
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    
}
