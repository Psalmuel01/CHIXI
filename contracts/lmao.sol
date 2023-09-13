// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Lmao is ERC20 {
    address public owner;

    constructor() ERC20 ("Leemao", "LMAO") {
        owner = msg.sender;
        _mint(owner, 1000000e18);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        uint fee = (8 * amount) / 100;
        uint remainingbal = amount - fee;
        super._transfer(from, to, remainingbal);

        // using super to inherit the main contract
        super._transfer(from, owner, fee);
    }
}
