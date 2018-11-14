pragma solidity ^0.4.0;
contract Distribute{
    address[] accounts = [0x14723a09acff6d2a60dcdf7aa4aff308fddc160c];
    uint Balance = 0;
    address owner;
   
   modifier onlyOwner{
       if(owner == msg.sender){
           _;
       }
       else{
           throw;
       }
   }
   
    function Distribute() public payable{
        owner = msg.sender;
    //   Balance += msg.value;
    }
    function draw() onlyOwner{
         
        for( uint i = 0; i < accounts.length ; i++ ){
        if(this.balance > 0){
            accounts[i].send(1000000000000000000);//sending 1 ether to all the address
            
        }
        --Balance;
        }
    }
    
    function checkBalance() constant returns(uint){
        return this.balance;
    }
    
    function kill() onlyOwner{
        suicide(owner);
    }
    
    function() payable{
        
    }
}

