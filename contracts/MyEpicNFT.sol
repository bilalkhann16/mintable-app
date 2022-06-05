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
    _setTokenURI(newItemId, "data:application/json;base64,eyJuYW1lIjoiTXkgRmlyc3QgRVBJQyBORlQiLCJkZXNjcmlwdGlvbiI6IkEgc2lsZW50IGhlcm8uIFR3aXR0ZXIgaXMgYSBncmVhdCBwbGFjZSB0byBsZWFybiBuZXcgc3R1ZmYuIiwiaW1hZ2UiOiJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUhkb2FYUmxPeUJtYjI1MExXWmhiV2xzZVRvZ2MyVnlhV1k3SUdadmJuUXRjMmw2WlRvZ01UUndlRHNnZlR3dmMzUjViR1UrQ2lBZ0lDQThjbVZqZENCM2FXUjBhRDBpTVRBd0pTSWdhR1ZwWjJoMFBTSXhNREFsSWlCbWFXeHNQU0ppYkdGamF5SWdMejRLSUNBZ0lEeDBaWGgwSUhnOUlqVXdKU0lnZVQwaU5UQWxJaUJqYkdGemN6MGlZbUZ6WlNJZ1pHOXRhVzVoYm5RdFltRnpaV3hwYm1VOUltMXBaR1JzWlNJZ2RHVjRkQzFoYm1Ob2IzSTlJbTFwWkdSc1pTSStSWEJwWTB4dmNtUklZVzFpZFhKblpYSThMM1JsZUhRK0Nqd3ZjM1puUGdvPSIsInN0cmVuZ3RoTGV2ZWwiOjc4LCJiZXN0RnJpZW5kIjoiNDA0IE5vdCBGb3VuZCJ9");
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    //increament the counter for when the next tokenId is needed. and next NFT is minted.
    _tokenIds.increment();
    }
}