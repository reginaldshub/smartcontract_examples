pragma solidity ^0.4.4;
contract Distribution{
    address owner;
    uint Balance;
    address public user1;
    address public user2;
    address public user3;
    uint avg;
    constructor() public payable{
         owner = msg.sender;
         Balance += msg.value;
    }
    
    function() public payable{
        Balance += msg.value;
    }
    function AvailableBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function User1() public{
        require(user1 == address(0));
        user1 = msg.sender;
    }
    
  function User2() public{
        require(user2 == address(0));
        user2 = msg.sender;
    }
    
    function User3() public{
        require(user3 == address(0));
        user3 = msg.sender;
    }
    
    function ShareBalance()public payable{
        require(msg.sender == owner);
        avg = (Balance - 9000000)/3;
        require(avg > 0);
        user1.transfer(avg);
        user2.transfer(avg);
        user3.transfer(avg);
        Balance = address(this).balance;
    }
}
