//
//  UIHostingController.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import SwiftUI

class FRHostingViewController<Content>: UIHostingController<Content> where Content: View {
	override init(rootView: Content) {
		super.init(rootView: rootView)
		self.view.backgroundColor = nil
	}
	
	@MainActor required dynamic init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
