# charity-smart-contract
This is a charity smart contract developed in Solidity that allows the addition of unlimited ERC20 tokens for donation purposes. The contract owner can add ERC20 tokens that can be used for donations, and users can donate to these tokens.
# Charity Smart Contract

[![Smart Contract](https://img.shields.io/badge/Smart%20Contract-Solidity-brightgreen)](https://soliditylang.org/)
[![Network](https://img.shields.io/badge/Network-Matic%20(Polygon)-blue)](https://polygon.technology/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is a charity smart contract developed in Solidity that allows the addition of unlimited ERC20 tokens for donation purposes. The contract owner can add ERC20 tokens that can be used for donations, and users can donate to these tokens.

## Features
- Ability to add unlimited ERC20 tokens for donation
- Donations can be made to any of the ERC20 tokens added by the contract owner
- The smart contract saves the addresses of all users who donate
- 5% of the donation amount is transferred to the contract deployer address as fees
- The contract balance can be checked by calling the `getBalance()` function
- Funds can be withdrawn from the contract by calling the `withdrawFunds()` function

## Getting Started

### Prerequisites
- Node.js
- Truffle

### Installation
1. Clone the repository and navigate to the project folder.
   ```sh
   git clone https://github.com/prafulljosh/charity-smart-contract
   cd charity-smart-contract
   ```
2. Install dependencies.
   ```sh
   npm install
   ```
3. Create a `.env` file and set the environment variables for the Matic network.
   ```sh
   touch .env
   ```
   ```sh
   MNEMONIC=<your-mnemonic>
   INFURA_PROJECT_ID=<your-infura-project-id>
   MATIC_RPC_URL=<your-matic-rpc-url>
   ```
4. Compile the smart contract.
   ```sh
   truffle compile
   ```
5. Deploy the smart contract to the Matic network.
   ```sh
   truffle migrate --network matic
   ```

## Usage
1. To add an ERC20 token for donation, call the `addToken()` function and pass the token address as a parameter. This function can only be called by the contract owner.
   ```solidity
   function addToken(address _tokenAddress) public onlyOwner {
       acceptedTokens[_tokenAddress] = true;
   }
   ```
2. To donate to a specific ERC20 token, call the `donate()` function and pass the token address and donation amount as parameters.
   ```solidity
   function donate(address _tokenAddress, uint256 _amount) public {
       require(acceptedTokens[_tokenAddress], "Token not accepted for donation");
       require(_amount > 0, "Invalid donation amount");
       
       IERC20 token = IERC20(_tokenAddress);
       require(token.transferFrom(msg.sender, address(this), _amount), "Token transfer failed");

       totalDonation += _amount;
       emit DonationReceived(msg.sender, _amount, _tokenAddress);
   }
   ```
3. To check the balance of the contract, call the `getBalance()` function.
   ```solidity
   function getBalance() public view returns (uint256) {
       return address(this).balance;
   }
   ```
4. To withdraw funds from the contract, call the `withdrawFunds()` function. This function can only be called by the contract owner.
   ```solidity
   function withdrawFunds() public onlyOwner {
       uint256 amount = address(this).balance;
       require(amount > 0, "No funds available to withdraw");
       payable(owner).transfer(amount);
       emit
