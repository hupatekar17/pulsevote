const hre = require("hardhat");

async function main() {
  const PulseVoteCitizenNFT = await hre.ethers.getContractFactory("PulseVoteCitizenNFT");
  const contract = await PulseVoteCitizenNFT.deploy();
  await contract.deployed();

  console.log(`PulseVoteCitizenNFT deployed to: ${contract.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
