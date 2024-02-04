//
//  ContentView.swift
//  cinco-de-mayo
//
//  Created by Patrik Duksin on 02/02/24.
//

import SwiftUI


struct ContentView: View {
	
	init() {
		
	}
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(red: 0.07, green: 0.07, blue: 0.07)
					.ignoresSafeArea()
				Welcome()
			}
		}
		.navigation
		.background(.red)
		.ignoresSafeArea()
	}
}

#Preview {
	ContentView()
}
