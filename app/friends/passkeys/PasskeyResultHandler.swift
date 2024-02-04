//
//  PasskeyResultHandler.swift
//  friends
//
//  Created by Patrik Duksin on 03/02/24.
//

import Foundation
import AuthenticationServices


final class PasskeyResultHandler: NSObject, ASAuthorizationControllerDelegate {
	
	private let publicKeyParser = Parser()
	public var registrationComplition: (() -> Void)? = nil
	public var signInComplition: ((_ sign: String) -> Void)? = nil
	
	func authorizationController(
			controller: ASAuthorizationController,
			didCompleteWithAuthorization authorization: ASAuthorization
	) {
		switch authorization.credential {
		case let registration as ASAuthorizationPlatformPublicKeyCredentialRegistration:
			guard let attestationObject = registration.rawAttestationObject else { fatalError() }
			
			registrationComplition?()
			print("pb", publicKeyParser.parseAttestationObject(object: attestationObject))
		case let assertion as ASAuthorizationPlatformPublicKeyCredentialAssertion:
			let signature = assertion.signature.base64EncodedString()
			let clientDataJSON = assertion.rawClientDataJSON
			// Verify on your server and finish signing in.
			signInComplition?(signature)
			print("signature, clientDataJSON", signature, clientDataJSON)
		default:
			print("oops")
		}
	}
	
	func authorizationController(
			controller: ASAuthorizationController,
			didCompleteWithError error: Error
	) {
		print(error)
	}
}
