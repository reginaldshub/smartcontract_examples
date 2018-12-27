pragma solidity ^0.4.18;
pragma experimental ABIEncoderV2;

contract certificates {
    address owner;
    constructor() public{
        owner = msg.sender;
    }
    
    struct Certificate {
        uint[] marks;
        string[] subject;
    }
    
    address[] private allowedAddress;
    address public requestedAddress;
    bool public verified = false;
    address private authority = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
    
     modifier onlyOwner{
       if(owner == msg.sender){
           _;
       }
       else{
           revert();
       }
   }
    
     modifier onlyAllowed{
         uint len = 0;
         while(len < allowedAddress.length){
       if(allowedAddress[len] == msg.sender){
           _;
       }
       len++;
    }
   }
    
    
    mapping (string => Certificate) certificate_name;
    // string[] public certificate_names;
    
    function setCertificateDetails(string _name, string _subject, uint _marks) onlyOwner public {
        if(!verified){
            Certificate storage cert = certificate_name[_name];
            cert.marks.push(_marks);
            cert.subject.push(_subject);
        }
    }
    
     function editCertificateDetails(string _name,uint _index, string _subject, uint _marks) onlyOwner public {
        if(!verified){
            certificate_name[_name].subject[_index] = _subject;
            certificate_name[_name].marks[_index] = _marks;
        }
    }
    
    //   function deleteCertificateDetails(string _name,uint _index) onlyOwner public {
    //     certificate_name[_name].subject.splice(_index, 1);
    //     certificate_name[_name].marks.splice(_index, 1);
    // }
    
    // function getCertificate_names() view public returns(string[]) {
    //     return certificate_names;
    // }
    
    function getCertificate(string _name)onlyAllowed view public returns (uint[], string[]) {
        return (certificate_name[_name].marks, certificate_name[_name].subject);
    }
    
    
    function grantAccess()onlyOwner public{
        allowedAddress.push(requestedAddress);
        requestedAddress = 0x00000000000000000;
    }
    
     function denyAccess()onlyOwner public{
        requestedAddress = 0x00000000000000000;
    }
    
    function requestAccess()public{
        requestedAddress = msg.sender;
    }
    
    function allowed()public view returns (address[]){
        return allowedAddress;
    }
    
     function verify() public{
        if(msg.sender == authority){
         verified = true;
        }
    }
    
}
