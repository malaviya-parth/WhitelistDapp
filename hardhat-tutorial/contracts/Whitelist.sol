// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Whitelist{

    // Maximum number of people who can join whitlist
    uint8 public maxWhitelistAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it will be part of verification
    uint8 public numAddressesWhitelisted;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistAddresses) {
        maxWhitelistAddresses = _maxWhitelistAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    function addAddressToWhitelist() public {

        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistAddresses, "More addresses cant be added, limit reached");

        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}