// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";


contract FundMe {
    using PriceConverter for uint256;

    uint256 public MIN_USD_AMOUNT = 5 * 10 ** 18;
    address[] public funders;
    mapping (address => uint256) addressToAmoundFunded;
    address public immutable isOwner;

    error NotOwner();

    constructor() {
        isOwner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MIN_USD_AMOUNT, "Min USD amount not met");
        addressToAmoundFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    modifier onlyOwner() {
        if (msg.sender != isOwner) revert NotOwner();
        _;
    }

    function withdraw() public onlyOwner {

        for (uint256 fundersIndex; fundersIndex < funders.length; fundersIndex++) {
            address funder = funders[fundersIndex];
            addressToAmoundFunded[funder] = 0;
        }
        funders = new address[](0);

        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "withdraw call failed");


        (bool isSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(isSuccess, "withdraw call failed");
    }

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }

}