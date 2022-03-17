//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/**
 * @title Vintage Token (VIT)
 * @author Israel Abazie
 * @notice Set address of the receiver
 */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract VintageToken is ERC20, Ownable {

    event Buy (address indexed from, address to, uint256 Tokens);

    mapping (address => uint256) balances;
    
    constructor() ERC20("Vintage Token", "VIT") {
        _mint(msg.sender, 1*10**6); // Vintage Token has a fixed supply of 1000,000 VIT
    }
    
    function buyTokens(address receiver, uint256 numTokens) public payable returns (bool) {
        require (msg.value >= 0.001 ether, "You have insufficient funds!"); //Cost of purchasing 1 Vintage Token (VIT) is 0.001ETH
        balances[receiver] += numTokens;
        balances[msg.sender] -= numTokens;
        emit Buy (msg.sender, receiver, numTokens);
        return true;
    }
}