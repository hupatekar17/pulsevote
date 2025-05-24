require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.18",
  networks: {
    mumbai: {
      url: "https://rpc-mumbai.maticvigil.com", // Or any Mumbai RPC
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
