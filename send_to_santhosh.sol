pragma solidity ^0.4.0;
contract Distribute{
    address[] accounts = [0x1b37d0412acca99222f61d500ac755a8e91db04d];
    uint Balance = 0;
   
    function Distribute() public payable{
       Balance += msg.value;
    }
    function draw() public{
         
        for( uint i = 0; i < accounts.length ; i++ ){
        if(Balance > 0){
            accounts[i].send(1000000000000000000);//sending 1 ether to all the address
            
        }
        --Balance;
        }
    }
}
