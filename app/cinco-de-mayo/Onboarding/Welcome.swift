//
//  Welcome.swift
//  cinco-de-mayo
//
//  Created by Patrik Duksin on 02/02/24.
//

import SwiftUI



struct Welcome: View {
	
	enum Strings {
		static let welcome = {
			let welcome = AttributedString("Welcome\nto ")
			var appName = AttributedString("Friends")
			appName.font = .system(size: 32, weight: .bold)
			return welcome + appName
		}()
		static let create = "Create new wallet"
		static let `import` = "Import existing wallet"
	}
	
	var body: some View {
			VStack(spacing: 80) {
				ZStack(alignment: .topLeading, content: {
					Image(.onboarding)
					Text(Strings.welcome)
						.font(.system(size: 32))
						.foregroundStyle(.white.opacity(0.95))
						.padding(.leading, 22)
						.padding(.top, 29)
				})
				
				VStack(spacing: 12) {
					NavigationLink(Strings.create) {
						CreateWallet()
					}
					.buttonStyle(GradientButtonStyle())
					Button(Strings.import) {}
						.buttonStyle(BlackButtonStyle())
				}
			}
			.padding(.vertical, 20)
			.padding(.horizontal, 16)
	}
}

#Preview {
	Welcome()
}
