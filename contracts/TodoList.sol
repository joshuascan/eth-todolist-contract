// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TodoList {
    
    struct Task {
        string description;
        bool completed;
        uint timestamp;
    }

    mapping(address => Task[]) private accounts;

    event TaskCreated(
        string description,
        bool completed,
        uint timestamp
    );

    event TaskCompleted(
        bool completed
    );

    function createTask(string calldata _description) external {
        uint _timestamp = block.timestamp;
        accounts[msg.sender].push(Task({
            description: _description,
            completed: false,
            timestamp: _timestamp
        }));

        emit TaskCreated(_description, false, _timestamp);
    }

    function getTasks() public view returns (Task[] memory) {
        return accounts[msg.sender];
    }

    function toggleCompleted(uint _index) external {
        Task memory _task = accounts[msg.sender][_index];
        _task.completed = !_task.completed;
        accounts[msg.sender][_index].completed = _task.completed;
        
        emit TaskCompleted(_task.completed);
    }
}