//
//  Parser.swift
//  friends
//
//  Created by Patrik Duksin on 03/02/24.
//

import PotentCBOR
import Foundation

struct PassKeyPublicKeys {
	let x: String
	let y: String
}

struct Parser {
	enum Keys {
		static let authData = CBOR.utf8String("authData")
		static let x = CBOR.negativeInt(1)
		static let y = CBOR.negativeInt(2)
	}
	func parseAttestationObject(object: Data) -> PassKeyPublicKeys {
		let parsedAttObject: CBOR
		do {
			parsedAttObject = try CBORSerialization.cbor(from: object)
		} catch {
			print(error)
			fatalError()
		}
		
		guard let authData = parsedAttObject[Keys.authData]?.bytesStringValue else {
			print("no auth Data on att object")
			fatalError()
		}
		
		let pb = extractPublicKeysFromAuthData(authData: authData)
		return getPublicKeys(cborPublicKeys: pb)
	}
	
	private func extractPublicKeysFromAuthData(authData: Data) -> Data {
		// skip parsing ids and etc from authdata object
		let skipBytes = 53
		
		let credentialIdLengthRange = skipBytes..<(skipBytes + 2)
		let credentialIdLength = UInt16(bigEndian: authData.subdata(in: credentialIdLengthRange).withUnsafeBytes { $0.load(as: UInt16.self) })
		
		let credIdByte = skipBytes + 2
		let credentialId = authData.subdata(in: credIdByte..<(credIdByte + Int(credentialIdLength)))
		
		let firstPublicKeyByte = credIdByte + Int(credentialIdLength)
		return authData.subdata(in: firstPublicKeyByte..<authData.count)
	}
	
	private func getPublicKeys(cborPublicKeys: Data) -> PassKeyPublicKeys {
		let parsedKeys: CBOR
		do {
			parsedKeys = try CBORSerialization.cbor(from: cborPublicKeys)
		} catch {
			print(error)
			fatalError()
		}
		
		guard let x = parsedKeys[Keys.x]?.bytesStringValue, let y = parsedKeys[Keys.y]?.bytesStringValue else {
			print("smth went wrong")
			fatalError()
		}
		return .init(x: x.hexDescription, y: y.hexDescription)
	}
}

extension Data {
		var hexDescription: String {
				return reduce("") {$0 + String(format: "%02x", $1)}
		}
}
