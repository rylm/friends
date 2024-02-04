//
//  WelcomeViewController.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit
import AuthenticationServices

class WelcomeViewController: UIViewController,  ASAuthorizationControllerPresentationContextProviding {
	func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		return view.window!
	}
	
	let handle = PasskeyResultHandler()
	let a = AccountRegistrationFabric().createAccount(name: "Friends wallet")
	let b = AccountRegistrationFabric().signData(data: .init())
	let buildCreateVC: () -> CreateWalletViewController
	
	init(buildCreateVC: @escaping () -> CreateWalletViewController) {
		self.buildCreateVC = buildCreateVC
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var createWalletAction: UIAction = {
		return .init { [weak self] _ in
			self?.a.presentationContextProvider = self
			self?.a.delegate = self?.handle
			self?.a.performRequests()
			self?.handle.registrationComplition = {
				let vc: CreateWalletViewController = self!.buildCreateVC()
				self!.navigationController?.pushViewController(vc, animated: true)
			}
		}
	}()
	
	private lazy var signInWalletAction: UIAction = {
		return .init { [weak self] _ in
			self?.b.presentationContextProvider = self
			self?.b.delegate = self?.handle
			self?.b.performRequests()
			self?.handle.signInComplition = { _ in
				let vc: CreateWalletViewController = self!.buildCreateVC()
				vc.navigateToMain()
			}
		}
	}()
	
	private lazy var notImpl = UIAction.notWorkingPopup(vc: self)
	
	override func loadView() {
		super.loadView()
		view = WelcomeUIView(createWallet: createWalletAction, notImpl: signInWalletAction)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}
