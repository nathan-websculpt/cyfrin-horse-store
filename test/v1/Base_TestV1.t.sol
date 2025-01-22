// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import {HorseStore} from "../../src/horseStoreV1/HorseStore.sol";
import {IHorseStore} from "../../src/horseStoreV1/IHorseStore.sol";
import {Test, console2} from "forge-std/Test.sol";

// Base Test will run all tests on both Huff and Sol contracts

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(address(new HorseStore()));
    }

    //by taking a fuzzing parameter as input, we can run fuzz tests
    function testWriteValue(uint256 numberOfHorses) public {
        horseStore.updateHorseNumber(numberOfHorses);
        assertEq(horseStore.readNumberOfHorses(), numberOfHorses);
    }

    function testReadValue() public view {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);
    }
}
