//
//  WelcomeUIView.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit

final class WelcomeUIView: UIView {
	
	enum Strings {
		static let welcome = {
			let welcomeAtr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32)]
			let welcome = NSAttributedString(string: "Welcome\nto ", attributes: welcomeAtr)
			let nameAtr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .bold)]
			let name = NSAttributedString(string: "Friends", attributes: nameAtr)
			let result = NSMutableAttributedString(attributedString: welcome)
			result.append(name)
			return result
		}()
		static let create = "Create new wallet"
		static let `import` = "Import existing wallet"
		static let terms = "By continuing, you agree to the Terms of Service and Privacy Policy"
	}

	lazy var welcomeLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		
		label.attributedText = Strings.welcome
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var welcomeImage: UIImageView = {
		let image = UIImage(resource: .onboarding)
		let view = UIImageView(image: image)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var createWalletButton: FriendsButton = {
		let button: FriendsButton = .init(buttonType: .gradient)
		button.setTitle(Strings.create, for: .normal)
		return button
	}()
	
	private lazy var importWallet: FriendsButton = {
		let button: FriendsButton = .init(buttonType: .black)
		button.setTitle(Strings.import, for: .normal)
		return button
	}()
	
	private lazy var buttonStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [createWalletButton, importWallet])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.spacing = 12
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var termsAndCond: UILabel = {
		let label = UILabel()
		label.text = Strings.terms
		label.textAlignment = .center
		label.numberOfLines = 2
		label.textColor = UIColor(red: 0.53, green: 0.538, blue: 0.538, alpha: 1)
		label.font = .systemFont(ofSize: 14)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	init(createWallet: UIAction, notImpl: UIAction) {
		super.init(frame: .zero)
		backgroundColor = UIColor(red: 0.071, green: 0.075, blue: 0.071, alpha: 1)
		createWalletButton.addAction(createWallet, for: .touchUpInside)
		importWallet.addAction(notImpl, for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		setupSubViews()
		super.layoutSubviews()
	}
	
	
	func setupSubViews() {
		
		addSubview(welcomeImage)
		
		welcomeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
		welcomeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
		welcomeImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		
		welcomeImage.addSubview(welcomeLabel)
		welcomeLabel.leadingAnchor.constraint(equalTo: welcomeImage.leadingAnchor, constant: 24).isActive = true
		welcomeLabel.topAnchor.constraint(equalTo: welcomeImage.topAnchor, constant: 32).isActive = true
		
		addSubview(buttonStack)
		addSubview(termsAndCond)
		buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
		buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
		buttonStack.bottomAnchor.constraint(equalTo: termsAndCond.topAnchor, constant: -32).isActive = true
		
		
		termsAndCond.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
		termsAndCond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
		termsAndCond.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
	}
	
}
