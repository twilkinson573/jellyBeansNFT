//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "hardhat/console.sol";

contract JellyBean is ERC721URIStorage, Ownable  {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string public JELLY_PROVENANCE;

    uint256 public constant JELLY_PRICE = 80000000000000000;

    uint256 public constant MAX_JELLIES = 12;

    constructor(string memory _jellyProvenance) ERC721("JellyBean", "BEAN") {
        JELLY_PROVENANCE = _jellyProvenance;
    }

    function mint() public {
        console.log(JELLY_PRICE);
        console.log(MAX_JELLIES);

    }

}
