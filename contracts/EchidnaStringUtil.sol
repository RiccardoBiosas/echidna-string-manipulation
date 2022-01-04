pragma solidity 0.8.0;

import "./StringUtil.sol";
import "hardhat/console.sol";

contract EchidnaStringUtil {
    using StringUtil for bytes32;
    string public output;

    constructor() {
        bytes32 base = "abcdefgdefg";
        output = base.toDerivativeHashStringIdentifier();
    }

    function sliceBytes(bytes32 _arg) public {
        output = _arg.toDerivativeHashStringIdentifier();
    }

    function echidna_stringUtil() public returns (bool) {
        return bytes(output).length == 6;
    }
}
