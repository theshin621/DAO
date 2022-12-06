//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract FakeNFTMarketplace {
// maintain a mapping of Fake Token ID to the address of the owner
mapping(uint256 => address) public tokens;

// set the purchase price of the Fake NFT
uint256 public nftPrice = 0.001 ether;

// purchase() accepts ETH and marks the owner of the given tokenId as the caller address
function purchase(uint256 _tokenId) external payable {
    require(msg.value == nftPrice, "Please pay the correct price, nft is 0.001 ether");
    tokens[_tokenId] = msg.sender;

}

// getPrice() returns the price of the Fake NFT
function getPrice() external view returns (uint256) {
    return nftPrice;

}

//available checks whether the given tokenId is available for purchase or sold
function available(uint256 _tokenId) external view returns (bool) {
    
    // address(0) is the default value for an address, so if the address of the owner of the token is 0,
    // then the token is available
    if (tokens[_tokenId] == address(0)) {
        return true;
    } else {
        return false;
    }



}

}