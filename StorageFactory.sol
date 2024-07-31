
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {SimpleStorage} from './SimpleStorage.sol';

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorageContracts;

    function addSimpleStorage() public {
        listOfSimpleStorageContracts.push(new SimpleStorage());
    }

    function factorySet(uint256 _contractIndex, uint256 _numberContractStores) public {
        listOfSimpleStorageContracts[_contractIndex].store(_numberContractStores);
    }

    function factoryGet(uint256 _contractIndex) public view returns (uint256){
        return listOfSimpleStorageContracts[_contractIndex].retrieve();
    }


}