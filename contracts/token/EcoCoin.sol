pragma solidity ^0.4.11;

import './Token.sol';

contract EcoCoin is Token {

    function EcoCoin(uint _start_count)
             Token("EcoCoin", "ECT", 18, _start_count) {}

    function emission(uint _value) onlyOwner {
        // Overflow check
        if (_value + totalSupply < totalSupply) throw;

        totalSupply     += _value;
        balances[owner] += _value;
    }
  
    function burn(uint _value) {
        if (balances[msg.sender] >= _value) {
            balances[msg.sender] -= _value;
            totalSupply      -= _value;
        }
    }
}
