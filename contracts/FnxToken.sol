pragma solidity 0.5.16;

import './ERC20.sol';
import './Owned.sol';


contract FnxToken is Owned, ERC20{
    using SafeMath for uint;

    string private _name = "FinNexus";
    string private _symbol = "FNX";

    uint8 private _decimals = 18;

    /// FinNexus total tokens supply
    uint public MAX_TOTAL_TOKEN_AMOUNT = 176495407 ether;

    modifier maxWanTokenAmountNotReached (uint amount){
    	  assert(totalSupply().add(amount) <= MAX_TOTAL_TOKEN_AMOUNT);
    	  _;
    }

    /**
     * @return the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @return the symbol of the token.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @return the number of decimals of the token.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }

  /**
     * EXTERNAL FUNCTION
     *
     * @dev change token name
     * @param name token name
     * @param symbol token symbol
     *
     */
    function changeTokenName(string memory name, string memory symbol)
        public
        onlyOwner
    {
        //check parameter in ico minter contract
        _name = name;
        _symbol = symbol;
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function mint(address account, uint256 amount)
        public
        onlyOwner
        maxWanTokenAmountNotReached(amount)
    {
        _mint(account,amount);
    }

}
