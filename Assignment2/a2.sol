// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {
    mapping(address => uint256) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() public {
        balances[tx.origin] = 100000;
    }

    function sendCoin(
        address receiver,
        uint256 amount,
        address sender
    ) public returns (bool sufficient) {
        if (balances[sender] < amount) return false;
        balances[sender] -= amount;
        balances[receiver] += amount;
        emit Transfer(sender, receiver, amount);
        return true;
    }

    function getBalance(address addr) public view returns (uint256) {
        return balances[addr];
    }
}

// Try not to edit the contract definition above

contract Loan is MetaCoin {
    // You can edit this contract as much as you want. A template is provided here and you can change the function names and implement anything else you want, but the basic tasks mentioned here should be accomplished.
    mapping(address => uint256) private loans;

    event Request(
        address indexed _from,
        uint256 P,
        uint256 R,
        uint256 T,
        uint256 amt
    );

    address private Owner;

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner"); // using the global variable msg.sender to validate
        _;
    }

    constructor() public {
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        emit OwnerSet(address(0), owner);
    }

    function getCompoundInterest(
        uint256 principle,
        uint256 rate,
        uint256 time
    ) public pure returns (uint256) {
        uint256 og_principle = principle;
        for (uint256 i = 0; i < time; i++)
            principle += (principle * rate) / 100;
        uint256 interest = principle - og_principle;
    }

    function reqLoan(
        uint256 principle,
        uint256 rate,
        uint256 time
    ) public returns (bool correct) {
        uint256 toPay = principle + getCompoundInterest(principle, rate, time);
        if (toPay < principle) return false;
        loans[msg.sender] = toPay;
        emit Request(msg.sender, principle, rate, time, toPay);
        return true;
    }

    function getOwnerBalance() public view returns (uint256) {
        return super.getBalance(Owner);
    }

    function viewDues(address requestor) public view isOwner returns (uint256) {
        return loans[requestor];
    }

    function settleDues(address requestor) public isOwner returns (bool) {
        bool x = super.sendCoin(requestor, loans[requestor], Owner);
        if (x) loans[requestor] = 0;
        return x;
    }
}
