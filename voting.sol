// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Voting {
    // Users can create Proposals
    // Users can vote on Proposals
    // View votes on any Proposal

    uint8 public id;

    struct Proposal {
        string description;
        uint8 proposalId;
        uint16 votes;
    }

    Proposal[] public proposal;

    mapping(address => mapping(uint8 => bool)) public voteStatus;

    event ProposalCreated(address, uint8, string);
    event Voted(address, bool);

    constructor() {
        id = 0;
    }
    function createProposal(string memory _description) public {
        // id += 1;
        id = id + 1;
        proposal.push(Proposal(_description, id, 0));
        emit ProposalCreated(msg.sender, id, "Successful");
    }

    function vote(uint8 _proposalId) public {
        require(!voteStatus[msg.sender][_proposalId] == true, 'Already Voted');
        proposal[_proposalId].votes += 1;
        voteStatus[msg.sender][_proposalId] = true;
        emit Voted(msg.sender, true);
    }

    function getVotes(uint8 _proposalId) public view {
        proposal[_proposalId].votes;
    }
}