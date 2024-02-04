//
//  CreateWalletUIView.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit

class CreateWalletUIView: UIView {
	
	enum Strings {
		static let title = "Name your wallet"
		static let description = "Only you will see the name"
		static let placeholder = {
			let placeholderAtr = [
				NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .medium),
				NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)
			]
			let placeholder = NSAttributedString(string: "Wallet name", attributes: placeholderAtr)
			return placeholder
		}()
		static let button = "Continue"
	}
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = .systemFont(ofSize: 32, weight: .bold)
		label.textColor = .white
		label.text = Strings.title
		return label
	}()
	
	private lazy var descriptionLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = .systemFont(ofSize: 20)
		label.textColor = .white.withAlphaComponent(0.25)
		label.text = Strings.description
		return label
	}()
	
	private lazy var titleStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
		stack.axis = .vertical
		stack.alignment = .center
		stack.spacing = 4
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	public private(set) lazy var walletNameTextField: UITextField = {
		let textField = UITextField(frame: .zero)
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.attributedPlaceholder = Strings.placeholder
		textField.font = .systemFont(ofSize: 32, weight: .medium)
		textField.textColor = .white
		textField.tintColor = .white
		return textField
	}()
	
	public private(set) lazy var createWalletButton: FriendsButton = {
		let button = FriendsButton(buttonType: .gradient)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle(Strings.button, for: .normal)
		return button
	}()
	
	override func layoutSubviews() {
		setup()
		super.layoutSubviews()
	}
	
	func setup() {
		backgroundColor = UIColor(red: 0.071, green: 0.075, blue: 0.071, alpha: 1)
		
		addSubview(titleStack)
		addSubview(walletNameTextField)
		addSubview(createWalletButton)
		
		titleStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		titleStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
		titleStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
		
		walletNameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
		let yAnchor = walletNameTextField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
		let buttonAnchor = walletNameTextField.bottomAnchor.constraint(lessThanOrEqualTo: createWalletButton.topAnchor, constant: -24)
		buttonAnchor.priority = .defaultHigh
		yAnchor.priority = .defaultLow
		NSLayoutConstraint.activate([yAnchor, buttonAnchor])
		
		createWalletButton.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -24).isActive = true
		createWalletButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
		createWalletButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
	}
}
