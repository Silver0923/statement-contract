# Statement Smart Contract

This Solidity program defines a smart contract that allows users to manage the state of a contract (open or closed) and to set and retrieve a contract name. The contract is designed to demonstrate basic Solidity concepts such as state management, function visibility, and error handling.

## Description

The Statement contract provides the following functionalities:

Open Contract: Allows users to open the contract if it is not already open.

Close Contract: Allows users to close the contract if it is not already closed.

Set Contract Name: Allows users to set the contract name, but only if the contract is open.

Get Contract Name: Allows users to retrieve the contract name, but only if the contract is open and the name has been set.

## Functions Overview

openContract: Opens the contract, making it active. An error is thrown if the contract is already open.

closeContract: Closes the contract, deactivating it. An error is thrown if the contract is already closed.

setName: Sets the contract name, but only if the contract is open.

getContractName: Retrieves the contract name. Throws an error if the contract is closed or the name has not been set.

## Error Handling

require: Used to validate conditions such as whether the contract is open or closed.

assert: Used to ensure that the state changes as expected.

revert: Used to handle situations where the contract name has not been set.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

contract Statement {
    string private cName;
    bool private contractOpen;

    function openContract() public {
        require(!contractOpen, "Contract is already open");
        contractOpen = true;

        assert(contractOpen == true);
    }

    function closeContract() public {
        require(contractOpen, "Contract is already closed");
        contractOpen = false;

        assert(contractOpen == false);
    }

    function setName(string memory _newContractName) public {
        require(contractOpen, "Contract not open");
        cName = _newContractName;
    }

    function getContractName() public view returns (string memory) {
        require(contractOpen, "Contract not open");

        if (bytes(cName).length == 0) {
            revert("Contract name not set");
        }

        return cName;
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HelloWorld" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the sayHello function. Click on the "HelloWorld" contract in the left-hand sidebar, and then click on the "sayHello" function. Finally, click on the "transact" button to execute the function and retrieve the "Hello World!" message.

## Authors

Silver0923 
[@metacraftersio](https://twitter.com/metacraftersio)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
