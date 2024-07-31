// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage {
    uint256 internal favouriteNumber;

    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }
}
