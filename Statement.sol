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
