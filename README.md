# SmartWallet

Overview

SmartWallet is a Solidity-based smart contract that allows an owner to manage funds, set allowances for specific addresses, and designate guardians who can collectively change ownership if needed.

Features

Owner Control: The contract has an owner who can manage funds and permissions.

Guardian System: Guardians can propose a new owner, and once enough confirmations are reached, ownership is transferred.

Allowance System: The owner can set allowances for other addresses to send funds from the wallet.

Secure Fund Transfer: Only authorized addresses can transfer funds based on their allowance.

Fallback Function: The contract can receive Ether.

Smart Contract Details

State Variables

owner: Address of the contract owner.

nextOwner: Proposed new owner (set by guardians).

Allowance: A mapping of addresses to their allowed withdrawal amounts.

isAllowed: A mapping that tracks whether an address is allowed to send funds.

guardian: A mapping that tracks designated guardians.

guardianResetCount: Number of guardian confirmations for an ownership transfer.

ConfirmationForOwnerReset: A constant that defines the required confirmations for ownership transfer.

Functions

constructor()

Initializes the contract and sets the deployer as the owner.

proposeNewOwner(address payable newOwner)

Allows guardians to propose a new owner.

Ownership is transferred if enough confirmations are reached.

setGuardian(address to)

Allows the owner to designate a new guardian.

setAllowance(address to, uint amount)

Allows the owner to set spending limits for specific addresses.

transferMoney(address payable to, uint amount, bytes memory payload) public payable returns(bytes memory)

Allows the owner or authorized addresses to transfer funds based on their allowance.

Calls an external contract if needed.

receive() external payable

Allows the contract to receive Ether.

Deployment

Deploy the contract on an Ethereum-compatible blockchain using Solidity 0.8.16.

Interact with the contract using a Web3 provider (e.g., Hardhat, Truffle, Remix, or Ethers.js).

Security Considerations

Ensure guardians are trustworthy, as they can collectively change ownership.

Always verify transactions before sending funds.

Use secure wallets for interacting with the contract.

License

This project is licensed under the MIT License.

