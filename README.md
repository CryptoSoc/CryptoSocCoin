# CryptoSocCoin
The Official UCT CryptoSoc Token
__Note: This tokensale runs on the Ethereum Ropsten testnet and will not raise any real money. It is for experimentation and fun. Don't be greedy.__

__Token Details__: The token "ICO" will be open from 00h00 15 January 2018 - 00h00 5 February 2018. 

The `CryptoSocTokensale` address is: `0x0370c54699550FF3A6b79D09225c5f06D0b6F6c8`

The `CryptoSocCoin` token address is: `0x1f5F9801FFD0Aea09A18Aee8358BB4cffCe7acd3`

You can view the contract and all of it's properties on the Ropsten Testnet version of [Etherscan.io](https://ropsten.etherscan.io/)
Just paste the addresses in the search bar.


## How to Participate

1. Get [MetaMask](metamask.io). Yes you can use many other ways to partake but you will have to use another tutorial and just substitute in the CryptoSocCoin addresses and ensure you are on the Ropsten testnet.

2. Claim some Ropsten testnet ETH. See below for recommended faucets.

3. Send testnet ETH to the `CryptoSocTokensale` contract. The address is:

__0x0370c54699550FF3A6b79D09225c5f06D0b6F6c8__

  You will have to wait for the transaction to be mined. You can monitor its progress on etherscan as well by searching for your address.

4. Add the `CryptoSocCoin` token contract as a token in your wallet. Click "Add Token" and put in: 

__0x1f5F9801FFD0Aea09A18Aee8358BB4cffCe7acd3__

  The rest of the field should automatically populate with their values after a second or two.

5. Your balance will appear as soon as the block is mined.


## Notes on Using Ropsten Testnet
The testnet is a development environment. That means the ETH you have is worth nothing. If you don't need all of it, donate it to a faucet. 

Don't send lots of transactions. We want you to try get the hang of participating in the Ethereum network and seeing what it's about but there are still maintainers who don't want to see all your spam transactions. In fact Ropsten was already DOS'ed.

### Claim some Testnet ETH
The first requires the [MetaMask](metamask.io) plugin which we highly recommend to participate in the crowdsale.

Claim some testnet ETH from these faucets:
- https://faucet.metamask.io/
- https://faucet.kyber.network/
- http://faucet.ropsten.be:3001/



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
  - The Web3 Provider is a locally run ethereum node. This can be difficult to set up but provides more fine-tuning capability. If you want to see a simple local testnet, try [testrpc](https://www.npmjs.com/package/ethereumjs-testrpc).
  
- Choose the "CryptoSocTokensale" contract from the dropdown.
- Put the constructor parameters in: the startICOtime, endICOtime, walletAddress, and adminAddress
  - times are UNIX time: time since 1970 try here: https://www.epochconverter.com/
  - Addresses must have quotation marks around them
    - If you're using the JavaScript VM, you can use one of the test addresses
    
- Click create and your contract will be deployed. See the console for success or failure messages. If your contract is successful, you will see the ABI just below where you clicked create appear

