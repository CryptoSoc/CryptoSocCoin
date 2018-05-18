pragma solidity ^0.4.13;

import './CryptoSocCoin.sol';
import './Zeppelin/math/SafeMath.sol';

// If using Remix solidity browser you can import directly from github
// import 'http://github.com/CryptoSoc/CryptoSocCoin/Zeppelin/math/SafeMath.sol';

/**
 * @title CryptoSocCoinCrowdsale
 * The Crowdsale contract for the UCT CryptoSoc Crowdsale
 * Read about us and sign up at:
 * https://cryptosoc.000webhostapp.com/
 */
contract CryptoSocCoinCrowdsale {
  using SafeMath for uint256;

  // The token being sold
  CryptoSocCoin public token;

  // start and end timestamps where investments are allowed (both inclusive)
  uint256 public startICO;
  uint256 public endICO;

  // address where funds are collected
  address public wallet;

  // how many token units a buyer gets per wei
  // 10 000 CSC tokens per 1 ETH
  uint256 public icoRate = 10000;

  // amount of raised money in wei
  uint256 public weiRaised;

  uint256 public socTokens = 30000000 * (10 ** 18);

  address public admin;

  modifier onlyAdmin() {
    require(msg.sender == admin);
    _;
  }

  /**
   * event for token purchase logging
   * @param purchaser who paid for the tokens
   * @param beneficiary who got the tokens
   * @param value weis paid for purchase
   * @param amount amount of tokens purchased
   */
  event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

  function CryptoSocCoinCrowdsale(uint256 _startTime, uint256 _endICO, address _wallet, address _admin)
    public
    {
    require(_startTime >= now);
    require(_wallet != 0x0);

    token = new CryptoSocCoin();
    startICO = _startTime;
    endICO = _endICO;
    wallet = _wallet;
    admin = _admin;
  }

  // fallback function can be used to buy tokens
  function () payable {
    buyTokens(msg.sender);
  }

//   low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    require(validPurchase());

    uint256 tokens = msg.value.mul(icoRate);

    token.updateTotalCirculatingSupply(tokens);

    // update state
    weiRaised = weiRaised.add(msg.value);

    token.transfer(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, msg.value, tokens);

    wallet.transfer(this.balance);
  }

  // @return true if the transaction can buy tokens
  function validPurchase() internal constant returns (bool) {
    bool withinPeriod = now >= startICO && now <= endICO;
    bool nonZeroPurchase = msg.value != 0;
    return withinPeriod && nonZeroPurchase;
  }

  // Withdraw the team tokens to an address
  function withdrawTeamTokens() public onlyAdmin returns (bool) {
    token.transfer(wallet, socTokens);
    return true;
  }

  //sends any left over funds to the wallet
  function finalizeSale() public onlyAdmin {
      require(now > endICO);

      if (this.balance>0){
          wallet.transfer(this.balance);
      }
      if(token.totalSupply() < token.MAX_SUPPLY()){
          token.transfer(wallet, token.MAX_SUPPLY().sub(token.totalSupply()));
      }
  }

}
