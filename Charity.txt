# Charity Smart Contract

![Charity Smart Contract](https://img.shields.io/badge/Charity-Smart%20Contract-<COLOR>.svg)
![Web3 Dev](https://img.shields.io/badge/Web3-Dev-<COLOR>.svg)
![Learner](https://img.shields.io/badge/Learner-<COLOR>.svg)
![Hustler](https://img.shields.io/badge/Hustler-<COLOR>.svg)
![Money Maker](https://img.shields.io/badge/Money-Maker-<COLOR>.svg)
![Crypto Trading](https://img.shields.io/badge/Crypto-Trading-<COLOR>.svg)
![Rich](https://img.shields.io/badge/Rich-Top%20G-<COLOR>.svg)

This is a Solidity smart contract for accepting ERC20 token donations for charity purposes. The contract allows the owner to add accepted ERC20 tokens that can be used for donations. Users can donate to the contract using any of the accepted ERC20 tokens. The contract keeps track of the total amount of donations received and the addresses of donors who have contributed to the contract.

## Installation

1. Clone the repository
   ```sh
   git clone https://github.com/<username>/charity-smart-contract.git
   ```
2. Install the dependencies
   ```sh
   npm install
   ```
3. Compile the smart contract
   ```sh
   npx hardhat compile
   ```
4. Deploy the smart contract
   ```sh
   npx hardhat run --network <network-name> scripts/deploy.js
   ```

## Usage

To use this smart contract, you will need to create an instance of the contract using its ABI and address. You can then interact with the contract using the methods provided by the contract.

### Methods

- `addToken(address _tokenAddress)`: Adds a new ERC20 token to the list of accepted tokens.
- `donate(address _tokenAddress, uint256 _amount)`: Allows a user to donate a specified amount of an ERC20 token to the contract.
- `getBalance()`: Returns the balance of the contract in Ether.
- `withdrawFunds()`: Allows the owner of the contract to withdraw the balance of the contract in Ether.
- `addTokens(address[] memory _tokenAddresses)`: Adds multiple ERC20 tokens to the list of accepted tokens.
- `isDonor(address _donor)`: Returns true if the specified address has made a donation to the contract.

### Events

- `DonationReceived(address indexed donor, uint256 amount, address indexed tokenAddress)`: Fired when a donation is made to the contract.
- `FundsWithdrawn(uint256 amount)`: Fired when funds are withdrawn from the contract.

## Audit

This smart contract has been audited by an independent third-party auditor to ensure that it is secure and free from vulnerabilities. You can find the audit report [here](https://example.com).

## License

This project is licensed under the MIT License - see the LICENSE file for details.
