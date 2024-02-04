//
//  CreateWalletViewController.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit
import AuthenticationServices

final class CreateWalletViewController: UIViewController, ASAuthorizationControllerPresentationContextProviding {
	private let accountRegistrationFabric = AccountRegistrationFabric()
	private let registrationHandler = PasskeyResultHandler()
	private lazy var welcomeView: CreateWalletUIView = .init(frame: .zero)
	let navigateToMain: () -> Void
	
	init(navigateToMain: @escaping () -> Void) {
		self.navigateToMain = navigateToMain
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view = welcomeView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.topItem?.backBarButtonItem = .init()
		navigationController?.navigationBar.topItem?.backBarButtonItem?.title = ""
		navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .white
	}
	
	override func viewWillAppear(_ animated: Bool) {
		welcomeView.createWalletButton.addAction(walletButtonAction(), for: .touchUpInside)
	}
	
	private func walletButtonAction() -> UIAction {
		return .init { [unowned self] _ in
			let controller = self.accountRegistrationFabric.signData(data: .init())

			self.registrationHandler.signInComplition = { _ in navigateToMain() }
			controller.delegate = self.registrationHandler
			controller.presentationContextProvider = self
			controller.performRequests()
		}
	}
	
	func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		return view.window!
	}
}
