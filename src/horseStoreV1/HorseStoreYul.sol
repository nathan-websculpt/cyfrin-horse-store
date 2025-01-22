// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.28;

contract HorseStoreYul {
    uint256 numberOfHorses;

    function updateHorseNumber(uint256 newNumberOfHorses) external {
        assembly {
            sstore(numberOfHorses.slot, newNumberOfHorses)
        }
    }

    function readNumberOfHorses() external view returns (uint256) {
        assembly {
            let num := sload(numberOfHorses.slot)
            mstore(0, num)
            return(0, 0x20)
            // Yul abstracts away the need to push to the stack
            // mstore(0, num) is saying:
            //      push num to the stack, push 0 to the stack, then mstore
        }
    }
}