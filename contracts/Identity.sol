pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract Identity {
    struct Value {
        uint number;
        string str;
    }
    mapping(string => Value) internal attributes;
    uint public points;
    address public owner;

    // Some basic functions
    constructor() public {
        owner = msg.sender;
    }

    function setAttribute(string memory name, uint number, string memory str) public {
        Value memory val = Value(number, str);
        attributes[name] = val;
    }

    function setAttributes(string[] memory names, uint[] memory numbers, string[] memory strings) public {
        for (uint i = 0; i < numbers.length; i++) {
            Value memory val = Value(numbers[i], strings[i]);
            attributes[names[i]] = val;
        }
    }
    
    function addPoints(uint point) public {
        points += point;
    }
}

contract ChickenRice is Identity {
    function buyRice() public {
        addPoints(40);
    }
}