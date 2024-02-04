//
//  FRButton.swift
//  cinco-de-mayo
//
//  Created by Patrik Duksin on 02/02/24.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(maxWidth: .infinity)
			.fontWeight(.semibold)
			.font(.system(size: 18))
			.foregroundColor(.white.opacity(0.95))
			.padding(.vertical, 20)
			.background(
				LinearGradient(
					stops: [
						Gradient.Stop(color: Color(red: 0.17, green: 0.73, blue: 0.63), location: 0.00),
						Gradient.Stop(color: Color(red: 0.12, green: 0.79, blue: 0.55), location: 1.00),
					],
					startPoint: UnitPoint(x: 0, y: 1),
					endPoint: UnitPoint(x: 1, y: 0)
				)
			)
			.cornerRadius(400)
			.shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
	}
}

struct BlackButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(maxWidth: .infinity)
			.fontWeight(.semibold)
			.font(.system(size: 18))
			.foregroundColor(.white.opacity(0.95))
			.padding(.vertical, 20)
			.background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.04))
			.cornerRadius(400)
			.overlay(
				RoundedRectangle(cornerRadius: 400)
					.inset(by: 0.5)
					.stroke(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.04), lineWidth: 1)
			)
	}
}

#Preview(traits: .sizeThatFitsLayout) {
	VStack {
		Button("Test 1") { }
		.buttonStyle(GradientButtonStyle())
		Button("Test 2") { }
		.buttonStyle(BlackButtonStyle())
	}
	.frame(width: 200)
	.background(Color(red: 0.07, green: 0.07, blue: 0.07))
}
