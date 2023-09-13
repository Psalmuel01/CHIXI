// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Wlmao is ERC20{
    IERC20 LMAO;
    constructor(address _LMAO) ERC20("WrappedLmao","WLMAO"){
         LMAO = IERC20(_LMAO);
    }
    function depositLmao (uint _amount)public{
        LMAO.transferFrom(msg.sender, address(this), _amount);
        uint calculate = (92 * _amount)/100;
        _mint(msg.sender, calculate);
}

   function swapBack(uint _amount)public{
    require(balanceOf(msg.sender) >= _amount, "must be greater than amount");
    LMAO.transfer(msg.sender, _amount);
    _burn(msg.sender, _amount);
   }
}