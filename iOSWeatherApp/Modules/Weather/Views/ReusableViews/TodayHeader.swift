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

    //MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
//       addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Subviews
    private lazy var topSack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [locationLabel,
                                                   shortForcast])
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()
    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
                                    temperatureLabel,
                                    highLowLabel])
        stack.alignment = .fill
        stack.distribution = .fill
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
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .ultraLight)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.backgroundColor = .green
        lbl.text = "9"
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.111).rounded(),weight: .light)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.setContentCompressionResistancePriority(.init(100), for: .vertical)
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
        lbl.setContentCompressionResistancePriority(.init(99), for: .vertical)
       return lbl
    }()
    //MARK:Instance methods
    private func addConstraints() {
        self.addSubviewsForAutoLayout([topSack])
        let topPadding =  self.frame.size.height * 0.18
        NSLayoutConstraint.activate([
            topSack.topAnchor.constraint(equalTo: self.topAnchor,constant: topPadding),
            topSack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topSack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topSack.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor,multiplier: 0.8),
            
//            bottomStack.topAnchor.constraint(equalTo: topSack.bottomAnchor),
//            bottomStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            bottomStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            topSack.heightAnchor.constraint(lessThanOrEqualTo: topSack.heightAnchor,multiplier: 0.5)
            
        ])
    }
    
    
}
