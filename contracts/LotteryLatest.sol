pragma solidity ^0.8.19

contract LotteryLatest{
    address public manager;
    address payable[] public players;

    constructor {
        manager = msg.sender;
    }

    function enter() public payable{
        require(msg.value > 0.01 ether);
        players.push(payable(msg.sender));
    }

    function random() private view returns(uint){
        returns unit(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)))
    }

    function pickWinner() public restricted{
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address payable[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
    }

    function getPlayers() public view return(address payable[] memory){
        return players;
    }

}