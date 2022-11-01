pragma solidity 0.8.7; 

contract Bank {
    
    mapping (address => uint) balance; 
    address owner; 
    
    event depositDone(uint amount, address depositedTo) ;
    event amountTransferred(uint amount, address toAddress, address fromAddress); //answer
    modifier onlyOwner {
        
        require(msg.sender == owner);
        _; 
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    function deposit() public payable returns (uint) {
        
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public payable {
        
        require(balance[msg.sender] >= amount, "Balance not Sufficient");
        require(msg.sender != recipient, "Can't transfer money to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        assert(balance[msg.sender] == previousSenderBalance - amount);
        
        emit amountTransferred(amount, recipient, msg.sender); //answer
        
    }
    
    function _transfer(address from, address to, uint amount) private {
        
        balance[from] -= amount; 
        balance[to] += amount;
        
    }
    
}
