// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PulseVoteCitizenNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;

    // Mapping to enforce soulbound behavior (non-transferable)
    mapping(uint256 => bool) private _minted;

    constructor() ERC721("PulseVote Citizen ID", "PVCID") {}

    /// @notice Mint a soulbound NFT to a verified citizen
    function mintCitizenNFT(address recipient, string memory metadataURI) public onlyOwner returns (uint256) {
        _tokenIds++;
        uint256 newTokenId = _tokenIds;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, metadataURI);
        _minted[newTokenId] = true;
        return newTokenId;
    }

    /// @notice Override transfer functions to make NFT soulbound
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override {
        require(from == address(0) || to == address(0), "This NFT is soulbound and cannot be transferred");
        super._beforeTokenTransfer(from, to, tokenId);
    }

    /// @notice Prevent approvals for soulbound NFTs
    function approve(address to, uint256 tokenId) public override {
        revert("Soulbound NFTs cannot be approved for transfer");
    }

    function setApprovalForAll(address operator, bool approved) public override {
        revert("Soulbound NFTs cannot be approved for transfer");
    }
}
