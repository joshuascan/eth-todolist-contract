// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TodoList {
    
    uint taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task({
            id: taskCount,
            content: _content,
            completed: false
        });

        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _taskId) public {
        Task memory _task = tasks[_taskId];
        _task.completed = !_task.completed;
        tasks[_taskId] = _task;

        emit TaskCompleted(_taskId, _task.completed);
    }
}