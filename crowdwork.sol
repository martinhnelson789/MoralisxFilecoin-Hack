pragma solidity ^0.8.0;



contract testContract {

  bytes32 public answer;
  bytes32 salt = bytes32("123123123");
  uint256 public term;
  bool public correct;
  bytes32[10] public answers;
  uint public fee = 0;
  string public filename;

  function setUptask(string memory _filename, string memory _answer0, string memory _answer1,  string memory _answer2, string memory _answer3, string memory _answer4, string memory _answer5, string memory _answer6, string memory _answer7, string memory _answer8,string memory _answer9) public payable {
        // The salt means pre-generated dictionaries are not valid
        // Store the answer to the question
        if(msg.value >= fee && term < block.number ){
        filename = _filename;
        term = block.number + 100;
        answers[0] = keccak256(abi.encodePacked(salt, _answer0));
        answers[1] = keccak256(abi.encodePacked(salt, _answer1));
        answers[2] = keccak256(abi.encodePacked(salt, _answer2));
        answers[3] = keccak256(abi.encodePacked(salt, _answer3));
        answers[4] = keccak256(abi.encodePacked(salt, _answer4));
        answers[5] = keccak256(abi.encodePacked(salt, _answer5));
        answers[6] = keccak256(abi.encodePacked(salt, _answer6));
        answers[7] = keccak256(abi.encodePacked(salt, _answer7));
        answers[8] = keccak256(abi.encodePacked(salt, _answer8));
        answers[9] = keccak256(abi.encodePacked(salt, _answer9));
        }
        
    }

    function verifyAnswer(address _to, string memory _attemptAnswer0, string memory _attemptAnswer1, string memory _attemptAnswer2, string memory _attemptAnswer3, string memory _attemptAnswer4, string memory _attemptAnswer5, string memory _attemptAnswer6, string memory _attemptAnswer7, string memory _attemptAnswer8, string memory _attemptAnswer9) public payable {
       bytes32[10] memory attemptanswer; 
        attemptanswer[0] = keccak256(abi.encodePacked(salt, _attemptAnswer0));
        attemptanswer[1] = keccak256(abi.encodePacked(salt, _attemptAnswer1));
        attemptanswer[2] = keccak256(abi.encodePacked(salt, _attemptAnswer2));
        attemptanswer[3] = keccak256(abi.encodePacked(salt, _attemptAnswer3));
        attemptanswer[4] = keccak256(abi.encodePacked(salt, _attemptAnswer4));
        attemptanswer[5] = keccak256(abi.encodePacked(salt, _attemptAnswer5));
        attemptanswer[6] = keccak256(abi.encodePacked(salt, _attemptAnswer6));
        attemptanswer[7] = keccak256(abi.encodePacked(salt, _attemptAnswer7));
        attemptanswer[8] = keccak256(abi.encodePacked(salt, _attemptAnswer8));
        attemptanswer[9] = keccak256(abi.encodePacked(salt, _attemptAnswer9));
        //correct = (attemptanswer == answers[1]);

        
        uint8 i=0;
        uint8 c=0;
        
        while ( i<10){
            if(attemptanswer[i] == answers[i]){
                c++;
            }
            
                i++;
        }

        if(c >2){
            //correct = true;
            uint256 bal = address(this).balance;
            payable(_to).transfer(bal);
            correct = false;
        }
        
    }
}
