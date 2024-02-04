pragma solidity >=0.8.17;

import {BaseAuthorizationModule} from "./BaseAuthorizationModule.sol";
import {UserOperation} from "@account-abstraction/contracts/interfaces/UserOperation.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Secp256r1, PassKeyId} from "./Secp256r1.sol";

contract PasskeyRegistryModule is BaseAuthorizationModule {
    string public constant NAME = "Passkeys Module";
    string public constant VERSION = "0.1.0";

    mapping(address => PassKeyId) public smartAccountPassKeys;

    error NoPassKeyRegisteredForSmartAccount(address smartAccount);
    error AlreadyInitedForSmartAccount(address smartAccount);

    function initForSmartAccount(
        uint256 _pubKeyX,
        uint256 _pubKeyY,
        string calldata _keyId
    ) external returns (address) {
        if (
            smartAccountPassKeys[msg.sender].pubKeyX != 0 &&
            smartAccountPassKeys[msg.sender].pubKeyY != 0
        ) revert AlreadyInitedForSmartAccount(msg.sender);
        smartAccountPassKeys[msg.sender] = PassKeyId(
            _pubKeyX,
            _pubKeyY,
            _keyId
        );
        return address(this);
    }
    
    function validateUserOp(
        UserOperation calldata userOp,
        bytes32 userOpHash
    ) external view virtual returns (uint256) {
        return _validateSignature(userOp, userOpHash);
    }

    function isValidSignature(
        bytes32 signedDataHash,
        bytes memory moduleSignature
    ) public view virtual override returns (bytes4) {
        return isValidSignatureForAddress(signedDataHash, moduleSignature);
    }

    function isValidSignatureForAddress(
        bytes32 signedDataHash,
        bytes memory moduleSignature
    ) public view virtual returns (bytes4) {
        if (_verifySignature(signedDataHash, moduleSignature)) {
            return EIP1271_MAGIC_VALUE;
        }
        return bytes4(0xffffffff);
    }

    function _verifySignature(
        bytes32 userOpDataHash,
        bytes memory moduleSignature
    ) internal view returns (bool) {
        (
            bytes32 keyHash,
            uint256 sigx,
            uint256 sigy,
            bytes memory authenticatorData,
            string memory clientDataJSONPre,
            string memory clientDataJSONPost
        ) = abi.decode(
                moduleSignature,
                (bytes32, uint256, uint256, bytes, string, string)
            );
        (keyHash);
        string memory opHashBase64 = Base64.encode(
            bytes.concat(userOpDataHash)
        );
        string memory clientDataJSON = string.concat(
            clientDataJSONPre,
            opHashBase64,
            clientDataJSONPost
        );
        bytes32 clientHash = sha256(bytes(clientDataJSON));
        bytes32 sigHash = sha256(bytes.concat(authenticatorData, clientHash));

        PassKeyId memory passKey = smartAccountPassKeys[msg.sender];
        if (passKey.pubKeyX == 0 && passKey.pubKeyY == 0)
            revert NoPassKeyRegisteredForSmartAccount(msg.sender);
        return Secp256r1.verify(passKey, sigx, sigy, uint256(sigHash));
    }

    function _validateSignature(
        UserOperation calldata userOp,
        bytes32 userOpHash
    ) internal view virtual returns (uint256 sigValidationResult) {
        if (_verifySignature(userOpHash, userOp.signature)) {
            return 0;
        }
        return SIG_VALIDATION_FAILED;
    }
}
