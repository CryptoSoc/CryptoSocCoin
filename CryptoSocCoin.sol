pragma solidity ^0.4.13;

import "./Zeppelin/token/StandardToken.sol";
import "./Zeppelin/ownership/Ownable.sol";
import "./Zeppelin/math/SafeMath.sol";

 /*
 * This is the smart contract for the CryptoSocCoin token.
 * Read about us and sign up at:
 * https://cryptosoc.000webhostapp.com/
 */

contract CryptoSocCoin is StandardToken, Ownable {
  using SafeMath for uint256;

  string public constant name = "CryptoSocCoin";
  string public constant symbol = "CSC";
  uint8 public constant decimals = 18;

  // 100 000 000 CryptoSocCoin tokens created
  uint256 public constant MAX_SUPPLY = 100000000 * (10 ** 18);

  // Tokens reserved for the UCT CryptoSoc
  // These tokens will be distributed at our events
  uint256 public socTokens = 30000000 * (10 ** 18);

  function CryptoSocCoin() {
    totalSupply = socTokens;
    balances[msg.sender] = MAX_SUPPLY;
  }

  // Update state of contract showing tokens bought
  function updateTotalCirculatingSupply(uint256 additions) onlyOwner {
      require(totalSupply.add(additions) <= MAX_SUPPLY);
      totalSupply += additions;
  }

  function transfer(address _to, uint _value) public returns (bool) {
        // Prevent transfer to 0x0 address
        require (_to != 0x0);
        // Check for overflows
        require (balanceOf(_to) + _value > balanceOf(_to));
        // Subtract from the sender
        balances[msg.sender] = balances[msg.sender].sub(_value);
        // Add the same to the recipient
        balances[_to] = balances[_to].add(_value);
        // Send out Transfer event to notify all parties
        Transfer(msg.sender, _to, _value);
        return true;
    }
}
