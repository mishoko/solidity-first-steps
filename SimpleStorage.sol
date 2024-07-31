// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage {
    uint256 internal favouriteNumber;
    struct Person {
        string name;
        uint256 favouriteNumber;
    }
    mapping(string  => uint256) public nameToFavouriteNumber;
    Person[] public listOfPplWithFavNums;

    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    function addPersonToList(string memory _name, uint256 _favNumber) public {
        listOfPplWithFavNums.push(Person(_name, _favNumber));
        nameToFavouriteNumber[_name] = _favNumber;
    }

    function getNumberByName(string memory _name) public view returns (uint256) {
        return nameToFavouriteNumber[_name];
    }
}
