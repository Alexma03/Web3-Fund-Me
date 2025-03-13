// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FundMe {

    uint256 public  minimumUsd = 5;

    function fund() public payable {
        require(msg.value >= minimumUsd, "No't enouht money");
    }

    // function withdraw() public {}
}
