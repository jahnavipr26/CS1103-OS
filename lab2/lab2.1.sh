#!/bin/bash

echo "Starting a background task..."
sleep 300 & 
task_pid=$! 
echo "Background task started with PID: $task_pid"
echo -e "\nListing jobs:"
jobs
echo -e "\nChecking if the task is running..."
ps -p $task_pid
echo -e "\nPausing the background task..."
kill -STOP $task_pid
echo -e "\nChecking task status after pausing (should be stopped):"
ps -o pid,stat,cmd -p $task_pid
echo -e "\nResuming the background task..."
kill -CONT $task_pid
echo -e "\nChecking task status after resuming (should be running):"
ps -o pid,stat,cmd -p $task_pid
echo -e "\nKilling the background task..."
kill $task_pid
echo -e "\nChecking task status after termination (should not exist):"
ps -p $task_pid && echo "Process still exists." || echo "Process terminated."
