// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "./ERC404.sol";

contract MyERC404 is ERC404 {
    string dataURI;
    string baseTokenURI;
    string metaDescription;

    constructor(address _owner) ERC404("Clippy", "CLPY", 18, 10000, _owner) {
        balanceOf[_owner] = 10000 * 10 ** 18;
        whitelist[_owner] = true;
    }

    function setDataURI(string memory _dataURI) public onlyOwner {
        dataURI = _dataURI;
    }

    function setTokenURI(string memory _tokenURI) public onlyOwner {
        baseTokenURI = _tokenURI;
    }

    function getNftImg(uint256 id) internal pure returns (string[2] memory) {
        uint8 idSeed = uint8(bytes1(keccak256(abi.encodePacked(id))));
        string memory image;
        string memory color;
        if (idSeed <= 100) {
            image = "1.jpg";
            color = "Retro Punk";
        } else if (idSeed <= 130) {
            image = "2.jpg";
            color = "Hybrid Cyborg";
        } else if (idSeed <= 160) {
            image = "3.jpg";
            color = "Ai Commander";
        } else if (idSeed <= 190) {
            image = "4.jpg";
            color = "Cyber Renegade";
        } else if (idSeed <= 220) {
            image = "5.jpg";
            color = "Web3 Evangelist";
        } else if (idSeed <= 255) {
            image = "6.jpg";
            color = "Future Humanoid";
        }
        return [image, color];
    }
    function setMetaDescription(string memory _metaDesc) public onlyOwner {
        metaDescription = _metaDesc;
    }
    
    function tokenURI(uint256 id) public view override returns (string memory) {
        
    }
}
