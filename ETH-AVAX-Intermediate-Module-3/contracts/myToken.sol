// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;



contract Token {

    // public variables here
    string public tokenName = "GRAYCERS";
    string public abbrv = "GYS";
    uint public totalSupply = 0;
    

    // mapping variable here
    mapping (address=> uint) public balances;

    // mint function with only owner can mint tokens
    function mint(address _address, uint _value) public onlyOwner{
        totalSupply += _value;
        balances[_address] += _value;  

    }


    // burn function
    function burn( address _address,uint _value) public {
        if( balances[_address] >= _value){
            totalSupply -= _value;
            balances[_address] -= _value;
        }
    // Transfer Tokens
    function transferTokens(address beneficiary, uint _amt) external{
    require(balanceOf(msg.sender) >= _amt, "Invalid Owner !!");
    approve(msg.sender,_amt);
    transferFrom(msg.sender, beneficiary,_amt);
    }

}
