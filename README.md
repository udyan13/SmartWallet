# 🚀 SmartWallet

## 📜 Overview
SmartWallet is a Solidity-based smart contract that enables secure and flexible fund management. The contract allows the owner to set allowances, designate guardians for ownership recovery, and facilitate controlled transfers.

## ✨ Features
- **👑 Owner Control**: The owner manages funds and permissions.
- **🛡️ Guardian System**: Guardians can propose a new owner, and once enough confirmations are reached, ownership is transferred.
- **💰 Allowance System**: The owner can set spending limits for specific addresses.
- **🔐 Secure Fund Transfer**: Only authorized addresses can transfer funds based on their allowance.
- **📥 Fallback Function**: The contract can receive Ether securely.

## 🔧 Smart Contract Details

### 📌 State Variables
- `owner`: Address of the contract owner.
- `nextOwner`: Proposed new owner (set by guardians).
- `Allowance`: Mapping of addresses to their allowed withdrawal amounts.
- `isAllowed`: Tracks whether an address is allowed to send funds.
- `guardian`: Tracks designated guardians.
- `guardianResetCount`: Number of guardian confirmations for ownership transfer.
- `ConfirmationForOwnerReset`: Required confirmations for ownership transfer.

### ⚙️ Functions

#### 🏗️ `constructor()`
- Initializes the contract and sets the deployer as the owner.

#### 🔄 `proposeNewOwner(address payable newOwner)`
- Allows guardians to propose a new owner.
- Transfers ownership once enough confirmations are reached.

#### 🛡️ `setGuardian(address to)`
- Allows the owner to designate a new guardian.

#### 💳 `setAllowance(address to, uint amount)`
- Allows the owner to set spending limits for specific addresses.

#### 💸 `transferMoney(address payable to, uint amount, bytes memory payload) public payable returns(bytes memory)`
- Allows the owner or authorized addresses to transfer funds based on their allowance.
- Supports external contract calls.

#### 📥 `receive() external payable`
- Allows the contract to receive Ether securely.

## 🚀 Deployment
1. Deploy the contract on an Ethereum-compatible blockchain using Solidity 0.8.16.
2. Interact with the contract using a Web3 provider (e.g., Hardhat, Truffle, Remix, or Ethers.js).

## 🔒 Security Considerations
- **Trustworthy Guardians**: Ensure guardians are reliable, as they can change ownership.
- **Transaction Verification**: Always verify transactions before sending funds.
- **Secure Wallets**: Use hardware or multi-signature wallets for better security.

## 📜 License
This project is licensed under the **MIT License**. Feel free to use and modify it as needed! 🛠️

