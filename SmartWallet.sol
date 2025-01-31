//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract SmartWallet{

    address payable public owner;
    address payable nextOwner;
    
    mapping (address => uint) Allowance;
    mapping (address => bool) isAllowed;

    mapping (address => bool) gaurdian;
    
    uint gaurdianResetCount;

    uint public constant ConfirmationForOwnerReset = 3;

    constructor(){
        owner = payable(msg.sender);
    }

    function purposeNewOwner(address payable newOwner) public {
        require(gaurdian[msg.sender],"You are not the gaurdian");
        if(newOwner != newOwner){
            nextOwner = newOwner;
            gaurdianResetCount = 0;
        }

        gaurdianResetCount++;

        if(gaurdianResetCount >= ConfirmationForOwnerReset){
            owner = nextOwner;
            nextOwner=payable(address(0));
        }

    }

    function setGaurdian(address to)public {
        require(msg.sender == owner,"You are not the owner, Aborting");
        gaurdian[to] = true;
    }

    function setAllowance(address to,uint amount) public {
        require(msg.sender == owner,"You are not the owner, Aborting");
        Allowance[msg.sender] = amount;

        if(amount >= 0){
            isAllowed[to] = true;
        }
        else{
            isAllowed[to] = false;
        }
        
    }

    function transferMoney(address payable to, uint amount, bytes memory payload) public payable returns(bytes memory) {
        
        if(msg.sender != owner){
            require(amount <= Allowance[msg.sender], "Trying to send more money then given allowance");
            require(isAllowed[msg.sender], "You are not allowed to send any money");

            Allowance[msg.sender] -= amount;
        }
        
        (bool success, bytes memory returnData) = to.call{value: amount}(payload);
        require(success,"Aborting call was not successfull");
        return returnData;
    }


    receive() external payable {}
}
