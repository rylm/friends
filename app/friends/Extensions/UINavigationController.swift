//
//  UINavigationController.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit

class FRUINavigationController: UINavigationController {
	
	@available(*, unavailable)
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(rootViewController: UIViewController) {
		super.init(rootViewController: rootViewController)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(red: 0.071, green: 0.075, blue: 0.071, alpha: 1)
	}
}
