//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "@solidstate/contracts/access/SafeOwnable.sol";
import "@solidstate/contracts/token/ERC20/ERC20.sol";

// This is the main building block for smart contracts.
contract FUT is ERC20, SafeOwnable {
  function mint (
    uint amount
  ) external onlyOwner {
    _mint(msg.sender, amount);
  }
}
