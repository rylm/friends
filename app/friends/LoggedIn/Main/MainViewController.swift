//
//  MainViewController.swift
//  friends
//
//  Created by Patrik Duksin on 03/02/24.
//

import UIKit

class MainViewController: UIViewController {
	
	private lazy var mainView = MainView(frame: .zero)
	
	override func loadView() {
		super.loadView()
		view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
