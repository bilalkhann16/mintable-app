// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

// first import some OpenZepplin Contracts.
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// we inherit the contract we imported. this means's we can use the inherited contract's method.
contract MyEpicNFT is ERC721URIStorage{
    //magic given to us by the OpenZepplin to help us keep track of tokenIDs.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

//passing the name of out NFT's token and the symbol of our token.
constructor() ERC721 ("BlockNFT", "BLK") {
    console.log("This is my NFT contract. Woah!");
}

//function of the contract. (will be called by the user)
function makeAnEpicNFT() public{
    // get the current tokenId, starting at 0
    uint256 newItemId = _tokenIds.current();

    //mint the NFT to the sender of the transaction. using msg.sender
    _safeMint(msg.sender, newItemId);
    //set the NFT's data.
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/TPIG");
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    //increament the counter for when the next tokenId is needed. and next NFT is minted.
    _tokenIds.increment();
    }
}