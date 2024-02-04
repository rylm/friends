//
//  Onboarding.swift
//  cinco-de-mayo
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit

final class OnboardingViewController: UINavigationController {
	
	let navigateToMain: () -> Void
	
	init(
		navigateToMain: @escaping () -> Void
	) {
		self.navigateToMain = navigateToMain
		let buildCreateVC = {
			return CreateWalletViewController(navigateToMain: navigateToMain)
		}
		super.init(rootViewController: WelcomeViewController(buildCreateVC: buildCreateVC))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
