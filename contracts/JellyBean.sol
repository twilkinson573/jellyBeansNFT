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

    uint256 public constant JELLY_PRICE = 80000000000000000; // 0.08

    uint256 public constant MAX_JELLIES = 12;

    string private _baseTokenURI;

    constructor(string memory _initialBaseURI, string memory _jellyProvenance) ERC721("JellyBean", "BEAN") {
        _baseTokenURI = _initialBaseURI;
        JELLY_PROVENANCE = _jellyProvenance;
        _tokenIds.increment();
    }

    function mint() public {
        uint256 newTokenId = _tokenIds.current();

        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, string(abi.encodePacked(Strings.toString(newTokenId), ".json")));

        _tokenIds.increment();
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

}
