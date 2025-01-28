echo "Parent Process ID: $$"
create_child_process() {
echo "Starting Child Process..."
sleep 3 
echo "Child Process ID: $PPID , Parent Process ID: $$"
}
create_child_process &
create_child_process &
wait
echo "All child processes have completed. Back to Parent Process ID: $$"
