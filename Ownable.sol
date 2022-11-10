contract Ownable {
    address internal owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _; //run the function
    }
    
    constructor(){
        owner = msg.sender;
    }
}
Footer
© 2022 Gi
