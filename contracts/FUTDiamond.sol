//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "@solidstate/contracts/proxy/diamond/Diamond.sol";
import "@solidstate/contracts/token/ERC20/ERC20MetadataStorage.sol";

contract FUTDiamond is Diamond {
  constructor() {
    ERC20MetadataStorage.Layout storage l = ERC20MetadataStorage.layout();
    l.name = "FUT - Football Universal Token";
    l.symbol = "FUT";
  }
}
