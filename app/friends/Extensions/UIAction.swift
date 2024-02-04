//
//  UIAction.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import UIKit

extension UIAction {
	static func notWorkingPopup(vc: UIViewController) -> UIAction  {
		return .init { _ in
			let alert = UIAlertController(title: "Not implemented", message: "Work in progress", preferredStyle: .alert)
			let ok = UIAlertAction(title: "OK", style: .default) { [weak alert] _ in
				alert?.dismiss(animated: true)
			}
			alert.addAction(ok)
			vc.present(alert, animated: true)
		}
	}
}
