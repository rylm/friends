//
//  ViewController.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
	
	private lazy var onboardingVC: UIViewController = {
		return OnboardingViewController(navigateToMain: navigateToMain)
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setChildVC(onboardingVC)
	}
	
	private func setChildVC(_ vc: UIViewController) {
		addChild(vc)
		view.addSubview(vc.view)
		vc.view.frame = view.frame
		vc.didMove(toParent: self)
	}
	
	private func removeChildVC(_ vc: UIViewController) {
		vc.willMove(toParent: nil)
		vc.view.removeFromSuperview()
		vc.removeFromParent()
	}
	
	func navigateToMain() {
		let vc = MainViewController()
		addChild(vc)
		view.addSubview(vc.view)
		vc.view.layer.opacity = 0
		vc.view.frame = .init(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height)
		vc.didMove(toParent: self)
		
		UIView.animate(withDuration: 0.45, delay: 0, options: [.curveEaseInOut, .preferredFramesPerSecond60]) {
			self.onboardingVC.view.layer.opacity = 0
			vc.view.layer.opacity = 1
			vc.view.frame = self.view.frame
		}
		removeChildVC(onboardingVC)
	}
}

