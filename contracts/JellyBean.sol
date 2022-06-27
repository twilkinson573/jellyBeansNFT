//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "hardhat/console.sol";

contract JellyBean is ERC721URIStorage, Ownable  {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string public JELLY_PROVENANCE;

    uint256 public immutable JELLY_PRICE; 

    uint256 public constant MAX_JELLIES = 13; // Max supply is 12, indexed from 1

    string private _baseTokenURI;

    constructor(string memory _initialBaseURI, uint256 _basePrice, string memory _jellyProvenance) ERC721("JellyBean", "BEAN") {
        _baseTokenURI = _initialBaseURI;
        JELLY_PRICE = _basePrice;
        JELLY_PROVENANCE = _jellyProvenance;
        _tokenIds.increment();
    }

    function mint() public payable {
        uint256 newTokenId = _tokenIds.current();
        require(newTokenId < MAX_JELLIES, "All Jellies have been minted");
        require(JELLY_PRICE < msg.value, "Not enough paid to mint");
 
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, string(abi.encodePacked(Strings.toString(newTokenId), ".json")));

        _tokenIds.increment();
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        _baseTokenURI = _newBaseURI;
    }

    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

}
