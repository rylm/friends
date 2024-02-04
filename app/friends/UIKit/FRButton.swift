//
//  FRButton.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit

enum FriendsButtonType {
	case gradient
	case black
}

final class FriendsButton: UIButton {
	
	private let type: FriendsButtonType
	
	private let gradientLayer = {
		let layer0 = CAGradientLayer()
		layer0.colors = [
			UIColor(red: 0.9, green: 0.233, blue: 0.236, alpha: 1).cgColor,
			UIColor(red: 0.948, green: 0.381, blue: 0.385, alpha: 1).cgColor
		]
		layer0.locations = [0, 1]
		layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
		layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
		return layer0
	}()
	
	init(buttonType: FriendsButtonType) {
		self.type = buttonType
		super.init(frame: .zero)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setup()
	}
	
	private func setup() {
		switch type {
		case .gradient:
			layer.insertSublayer(gradientLayer, at: 0)
			gradientLayer.frame = bounds
			gradientLayer.cornerRadius = bounds.height / 2
			break
		case .black:
			backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 0.04)
			layer.cornerRadius = bounds.height / 2
			layer.borderWidth = 1
			layer.borderColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 0.04).cgColor
			break
		}
		
		topAnchor.constraint(equalTo: titleLabel!.topAnchor, constant: -20).isActive = true
		bottomAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 20).isActive = true
		
		titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
	}
}
