//
//  OnboardingModel.swift
//  cinco-de-mayo
//
//  Created by Patrik Duksin on 02/02/24.
//

import Foundation

enum OnboardingScreen: CaseIterable {
	case welcome
	case create
}

final class OnboardingModel: ObservableObject {
	@Published var screenStack: [OnboardingScreen] = []
}
