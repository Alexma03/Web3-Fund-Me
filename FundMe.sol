// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public  minimumUsd = 5e18;

    function fund() public payable {
        require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough ETH");
    }

    // function withdraw() public {}

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        (,int answer,,,) = priceFeed.latestRoundData();
        // tenemos que multiplicar por 10 para que los decimales de la funcion get value coincidan con el precio de eth
        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        return (ethAmount * ethPrice) / 1e18;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
