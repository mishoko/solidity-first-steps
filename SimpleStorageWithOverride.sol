// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {SimpleStorage } from './SimpleStorage.sol';

contract AddFiveToSimpleStorage is SimpleStorage{
    function store(uint256 _favNumber) public override {
        favouriteNumber = _favNumber + 5;
    }
}