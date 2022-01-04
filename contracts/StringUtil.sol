pragma solidity 0.8.0;

library StringUtil {
    /// @notice It is used to obtain a slice of derivativeHash and convert it to a string to be used as part of an Opium position token's name
    /// @param _data bytes32 representing a derivativeHash
    /// @return string representing the first 4 characters of a derivativeHash prefixed by "0x"
    function toDerivativeHashStringIdentifier(bytes32 _data) internal pure returns (string memory) {
        bytes4 result;
        assembly {
            result := or(
                and(
                    or(
                        shr(4, and(_data, 0xF000F000F000F000F000F000F000F000F000F000F000F000F000F000F000F000)),
                        shr(8, and(_data, 0x0F000F000F000F000F000F000F000F000F000F000F000F000F000F000F000F00))
                    ),
                    0xffff000000000000000000000000000000000000000000000000000000000000
                ),
                shr(
                    16,
                    or(
                        shr(4, and(shl(8, _data), 0xF000F000F000F000F000F000F000F000F000F000F000F000F000F000F000F000)),
                        shr(8, and(shl(8, _data), 0x0F000F000F000F000F000F000F000F000F000F000F000F000F000F000F000F00))
                    )
                )
            )
        }

        return
            string(
                abi.encodePacked(
                    "0x",
                    bytes4(0x30303030 + uint32(result) + (((uint32(result) + 0x06060606) >> 4) & 0x0F0F0F0F) * 7)
                )
            );
    }

}