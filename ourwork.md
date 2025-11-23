# Wallet

Our team developed a demo wallet (non custodial, multicahin, soft/hot) with follwing features.

* On ramp (using moonpay)
* Off ramp (using moonpay)
* Send (infura - using default send fetaure of blockchains)
* Reveive (infure - using default send fetaure of blockchains)
* Swap (quiknode)
* Briedge (quiknode)

<details>
<summary>
A sample code for infura links configuration
</summary>
export const infuraProviders = {
  1: `https://mainnet.infura.io/v3/${INFURA_KEY}`, // Ethereum Mainnet
  137: `https://polygon-mainnet.infura.io/v3/${INFURA_KEY}`, // Polygon
  43114: `https://avalanche-mainnet.infura.io/v3/${INFURA_KEY}`, // Avalanche
  10: `https://optimism-mainnet.infura.io/v3/${INFURA_KEY}`, // Optimism Mainnet
  56: `https://bsc-mainnet.infura.io/v3/${INFURA_KEY}`, // BSC Mainnet
  11155111: `https://sepolia.infura.io/v3/${INFURA_KEY}`, // Ethereum Sepolia
  80002: `https://polygon-amoy.infura.io/v3/${INFURA_KEY}`, // Polygon Amoy
  11155420: `https://optimism-sepolia.infura.io/v3/${INFURA_KEY}`, // Optimism Sepolia
  43113: `https://avalanche-fuji.infura.io/v3/${INFURA_KEY}`, // Avalanche Fuji
  97: `https://bsc-testnet.infura.io/v3/${INFURA_KEY}`, // BSC Testnet (custom RPC, Infura doesn't support this officially)
};
</details>

## Plan

Develop ERC20, ERC721 and ERC 4337 standards

[Back](Readme.md)
