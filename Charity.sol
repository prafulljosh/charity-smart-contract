pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract Charity {
    address public owner;
    mapping(address => bool) public acceptedTokens;
    mapping(address => bool) public donors;

    uint256 public totalDonation;

    event DonationReceived(address indexed donor, uint256 amount, address indexed tokenAddress);
    event FundsWithdrawn(uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can perform this action");
        _;
    }

    function addToken(address _tokenAddress) public onlyOwner {
        acceptedTokens[_tokenAddress] = true;
    }

    function donate(address _tokenAddress, uint256 _amount) public {
        require(acceptedTokens[_tokenAddress], "Token not accepted for donation");
        require(_amount > 0, "Invalid donation amount");
        
        IERC20 token = IERC20(_tokenAddress);
        require(token.transferFrom(msg.sender, address(this), _amount), "Token transfer failed");

        totalDonation += _amount;
        donors[msg.sender] = true;
        emit DonationReceived(msg.sender, _amount, _tokenAddress);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawFunds() public onlyOwner {
        uint256 amount = address(this).balance;
        require(amount > 0, "No funds available to withdraw");
        payable(owner).transfer(amount);
        emit FundsWithdrawn(amount);
    }

    function addTokens(address[] memory _tokenAddresses) public onlyOwner {
        for (uint i = 0; i < _tokenAddresses.length; i++) {
            acceptedTokens[_tokenAddresses[i]] = true;
        }
    }

    function isDonor(address _donor) public view returns (bool) {
        return donors[_donor];
    }
}
