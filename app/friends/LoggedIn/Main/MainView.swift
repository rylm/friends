//
//  MainView.swift
//  friends
//
//  Created by Patrik Duksin on 03/02/24.
//

import UIKit

class MainView: UIView {
	public private(set) lazy var settingsButton: UIButton = {
		let button = UIButton(frame: .zero)
		button.setImage(.settings, for: .normal)
		return button
	}()
	
	public private(set) lazy var notificationButton: UIButton = {
		let button = UIButton(frame: .zero)
		button.setImage(.notifications, for: .normal)
		return button
	}()
	
	private lazy var title: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = .systemFont(ofSize: 18, weight: .bold)
		label.textColor = .white.withAlphaComponent(0.75)
		label.text = "Friends wallet"
		return label
	}()
	
	private lazy var tabBar: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [settingsButton, title, notificationButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.distribution = .equalCentering
		return stack
	}()
	
	private lazy var balanceCard: UIView = {
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white.withAlphaComponent(0.05)
		view.layer.cornerRadius = 16
		view.layer.borderWidth = 1
		view.layer.borderColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 0.04).cgColor
		
		let walletName: UILabel = .init(frame: .zero)
		walletName.text = "Friends wallet"
		walletName.font = .systemFont(ofSize: 18)
		walletName.textColor = .white.withAlphaComponent(0.75)
		
		let updateLabel: UILabel = .init(frame: .zero)
		updateLabel.text = "Updated just now"
		updateLabel.font = .systemFont(ofSize: 12)
		updateLabel.textColor = .white.withAlphaComponent(0.4)
		
		let updateButton = UIButton(frame: .zero)
		updateButton.setImage(.update, for: .normal)
		
		let updateStack = UIStackView(arrangedSubviews: [updateLabel, updateButton])
		updateStack.spacing = 8
		
		let topStack = UIStackView(arrangedSubviews: [walletName, updateStack])
		topStack.translatesAutoresizingMaskIntoConstraints = false
		
		let bottomStack = UIStackView(arrangedSubviews: [addressLabel, copyAddresButton])
		bottomStack.spacing = 8
		
		let mainStack = UIStackView(arrangedSubviews: [topStack, balanceLabel, bottomStack])
		mainStack.translatesAutoresizingMaskIntoConstraints = false
		mainStack.axis = .vertical
		mainStack.spacing = 8
		mainStack.alignment = .leading
		
		view.addSubview(mainStack)
		
		mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
		mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
		mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
		topStack.widthAnchor.constraint(equalTo: mainStack.widthAnchor).isActive = true
		
		return view
	}()
	
	private lazy var balanceLabel: UIView = {
		let view = UIImageView(image: .frame7)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 95).isActive = true
		view.heightAnchor.constraint(equalToConstant: 57).isActive = true
		return view
	}()
	
	private lazy var addressLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = "0xb39a61E93a6C463F8881F2bFA93c65d13Ed72f29"
		label.numberOfLines = 1
		label.lineBreakMode = .byTruncatingMiddle
		label.adjustsFontSizeToFitWidth = false
		label.font = .systemFont(ofSize: 12)
		label.textColor = .white.withAlphaComponent(0.4)
		return label
	}()
	
	private lazy var copyAddresButton: UIButton = {
		let button = UIButton(frame: .zero)
		button.setImage(.copy, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.widthAnchor.constraint(equalToConstant: 20).isActive = true
		button.heightAnchor.constraint(equalToConstant: 20).isActive = true
		return button
	}()
	
	private lazy var sendButton: UIButton = {
		let button = FriendsButton(buttonType: .black)
		button.setTitle("Send", for: .normal)
		button.setImage(.hsend, for: .normal)
		return button
	}()
	
	private lazy var depositButton: UIButton = {
		let button = FriendsButton(buttonType: .gradient)
		button.setTitle("Deposit", for: .normal)
		button.setImage(.deposit, for: .normal)
		return button
	}()
	
	private lazy var transactionsView: UIView = {
		let view = UIView(frame: .zero)
		view.backgroundColor = .white.withAlphaComponent(0.05)
		view.layer.cornerRadius = 10
		view.translatesAutoresizingMaskIntoConstraints = false
		
		let grabber = UIView(frame: .zero)
		grabber.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.3)
		grabber.layer.cornerRadius = 2
		grabber.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(grabber)
		grabber.widthAnchor.constraint(equalToConstant: 36).isActive = true
		grabber.heightAnchor.constraint(equalToConstant: 5).isActive = true
		grabber.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		grabber.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
		
		let dateLabel = UILabel(frame: .zero)
		dateLabel.text = "Today"
		dateLabel.font = .systemFont(ofSize: 14, weight: .medium)
		dateLabel.textColor = .white.withAlphaComponent(0.4)
		dateLabel.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(dateLabel)
		dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
		return view
	}()
	
	private lazy var searchButton: UIButton = {
		let searchButton = UIButton(frame: .zero)
		searchButton.setImage(.searchIcon, for: .normal)
		searchButton.layer.cornerRadius = 18
		searchButton.layer.borderWidth = 1
		searchButton.layer.borderColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 0.04).cgColor
		searchButton.translatesAutoresizingMaskIntoConstraints = false
		return searchButton
	}()
	
	private lazy var transactionTemplate: UIImageView = {
		let image = UIImage(resource: .frame26)
		let view = UIImageView(image: image)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor(red: 0.071, green: 0.075, blue: 0.071, alpha: 1)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		setupSubviews()
		super.layoutSubviews()
	}
	
	func setupSubviews() {
		addSubview(tabBar)
		tabBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		tabBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
		tabBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
		
		addSubview(balanceCard)
		
		balanceCard.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
		balanceCard.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
		balanceCard.topAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: 20).isActive = true
		
		let buttonStack = UIStackView(arrangedSubviews: [sendButton, depositButton])
		buttonStack.translatesAutoresizingMaskIntoConstraints = false
		buttonStack.spacing = 2
		buttonStack.distribution = .fillEqually
		
		addSubview(buttonStack)
		buttonStack.topAnchor.constraint(equalTo: balanceCard.bottomAnchor, constant: 12).isActive = true
		buttonStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
		buttonStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
		buttonStack.heightAnchor.constraint(equalToConstant: 72).isActive = true
		
		addSubview(transactionsView)
		transactionsView.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 20).isActive = true
		transactionsView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		transactionsView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		transactionsView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		
		transactionsView.addSubview(searchButton)
		searchButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
		searchButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
		searchButton.trailingAnchor.constraint(equalTo: transactionsView.trailingAnchor, constant: -20).isActive = true
		searchButton.topAnchor.constraint(equalTo: transactionsView.topAnchor, constant: 13).isActive = true
		
		transactionsView.addSubview(transactionTemplate)
		transactionTemplate.topAnchor.constraint(equalTo: transactionsView.topAnchor, constant: 60).isActive = true
		transactionTemplate.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		transactionTemplate.widthAnchor.constraint(equalTo: transactionsView.widthAnchor, constant: -32).isActive = true
		
	}
	
}
