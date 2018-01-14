# CryptoSocCoin
The Official UCT CryptoSoc Token

To be deployed soon...

## To Interact with the Live Contract

The contract has not been deployed yet. Further details will be provided soon.

You can view contracts and, if they have been verified, their source code and ABI.

To interact with them in a high level way, you can use [MyEtherWallet](https://www.myetherwallet.com/#contracts). You will need the ABI (possibly from etherscan.io) and the contract address. 

For simplicity the CryptoSocCoin token will be launched on a testnet so that users can get coins for free. You will need to claim free testnet ETH from a faucet on the same testnetwork.

For simple interaction with testnets, we recommend using the [MetaMask](metamask.io) plugin for chrome and Firefox.

## How to Deploy Your Own CryptoSocCoin

You can deploy your own CryptoSocCoin either locally or if you're willing to pay the transaction fee, to the mainnet. The simplest way to do this is through the [Solidity Remix Online IDE](https://remix.ethereum.org)

Once in the Remix IDE:
- Copy the code from this repo into files in the IDE
- Compile the files
- Go to the run tab in the top right
- Choose your runtime environment
  - The JavaScript virtual machine is the easiest and simulates the blockchain in your browser. It requires no other software install and gives you test accounts with test ETH. If you don't know what to use, use this.
  - The Injected Web3 is a JSON-RPC connection to an ethereum node. One way to use injected web3 is through [MetaMask](metamask.io) - a simple browser plugin. This llows you to connect to the Ethereum mainnet and testnets. Note: If you deploy to the mainnet you will pay around $10 in transaction fees to launch the contract.
  The Web3 Provider is a locally run ethereum node. This can be difficult to set up but provides more fine-tuning capability. If you want to see a simple local testnet, try [testrpc](https://www.npmjs.com/package/ethereumjs-testrpc).
- Choose the "CryptoSocTokensale" contract from the dropdown.
- Put the constructor parameters in: the startICOtime, endICOtime, walletAddress, and adminAddress
  - times are UNIX time: time since 1970 try here: https://www.epochconverter.com/
  - Addresses must have quotation marks around them
    - If you're using the JavaScript VM, you can use one of the test addresses
- Click create and your contract will be deployed. See the console for success or failure messages. If your contract is successful, you will see the ABI just below where you clicked create appear

