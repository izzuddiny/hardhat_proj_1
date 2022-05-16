// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ref_CircuitBreaker{
    bool private stopped = false;
    address private owner;

    //authorisation to only 1 to trigger
    modifier isAdmin(){
        require(msg.sender == owner);
        _;
    }

    function toggleContractActive() isAdmin public {
        stopped = !stopped;
    }

    // Verify status is not stopped; continue
    modifier stopInEmergency { if (!stopped) _;}

    // Verify status is stopped; continue
    modifier onlyInEmergency { if (stopped) _;}

    function deposit() stopInEmergency public {
        // Some code
    }

    function withdraw() onlyInEmergency public {
        // Some code
    }
}