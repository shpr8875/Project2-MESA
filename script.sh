#!/bin/bash
display_current_running_proc() {
    echo "Current running processes:"
    ps aux
    echo
}
display_date_time_kernel() {
    local current_datetime
    current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
    echo "Current date and time: $current_datetime"
    echo "Kernel version: $(uname -r)"
}
display_kernel_dump() {
    echo "Kernel dump:"
    cat /cygdrive/c/DumpStack.log.tmp
}
display_current_running_proc
display_date_time_kernel
display_kernel_dump

# Log file path
LOG_FILE="my_script_log.txt"

# Redirect the output of functions to the log file
{
    echo "----- Log started: $(date) -----"

    # Call your functions and store the output in the log file
   display_current_running_proc
   display_date_time_kernel
   display_kernel_dump

    echo "----- Log ended: $(date) -----"
} >> "$LOG_FILE"
