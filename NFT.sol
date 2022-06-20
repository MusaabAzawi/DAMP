//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address payable owner;


    mapping(address => uint[])public NFTOwner;

    constructor() ERC721("My NFT","NFT"){
      owner = payable(msg.sender);
    }

    function getBalance() public view returns(uint256 balance){
      return address(owner).balance;
    }


    
     
    function mint(string memory tokenURI) external returns(uint){
         _tokenIds.increment();
         uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        NFTOwner[msg.sender].push(newItemId);
        return newItemId;
    }

}
