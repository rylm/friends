//
//  AccountRegistration.swift
//  friends
//
//  Created by Patrik Duksin on 02/02/24.
//

import Foundation
import UIKit
import AuthenticationServices

extension UUID {
	public func asUInt8Array() -> [UInt8] {
		let (u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16) = self.uuid
		return [u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16]
	}
	public func data() -> Data {
		return Data(self.asUInt8Array())
	}
}

final class AccountRegistrationFabric: NSObject, ASAuthorizationControllerDelegate {
	let domain = "starfish-app-plo3s.ondigitalocean.app"
	
	func createAccount(name: String) -> ASAuthorizationController {
		// challenge not needed, we just need to get data about public key
		let challenge = Data()
		let userID = UUID().data()
		
		
		let provider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: domain)
		let registrationRequest = provider.createCredentialRegistrationRequest(challenge: challenge, name: name, userID: userID)
		
		let controller = ASAuthorizationController(authorizationRequests: [registrationRequest])
		controller.delegate = self
		
		return controller
	}
	
	func signData(data: Data) -> ASAuthorizationController {
		let publicKeyCredentialProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: domain)
		
		let assertionRequest = publicKeyCredentialProvider.createCredentialAssertionRequest(challenge: data)
		
		// Also allow the user to use a saved password, if they have one.
		let passwordCredentialProvider = ASAuthorizationPasswordProvider()
		let passwordRequest = passwordCredentialProvider.createRequest()
		
		// Pass in any mix of supported sign-in request types.
		let authController = ASAuthorizationController(authorizationRequests: [ assertionRequest, passwordRequest ] )
		return authController
	}
	
}
