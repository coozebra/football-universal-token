//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "@solidstate/contracts/access/OwnableStorage.sol";
import "@solidstate/contracts/access/SafeOwnable.sol";
import "@solidstate/contracts/token/ERC20/ERC20.sol";
import "@solidstate/contracts/token/ERC20/ERC20MetadataStorage.sol";
import "hardhat/console.sol";

// This is the main building block for smart contracts.
contract FUT is ERC20, SafeOwnable {
    /**
     * Contract initialization.
     *
     * The `constructor` is executed only once when the contract is created.
     */
    constructor() {
        ERC20MetadataStorage.Layout storage l = ERC20MetadataStorage.layout();
        l.name = "FUT - Football Universal Token";
        l.symbol = "FUT";

        _mint(msg.sender, 1000000 ether);

        OwnableStorage.layout().owner = msg.sender;
    }
}
