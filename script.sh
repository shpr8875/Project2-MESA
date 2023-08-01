#!/bin/bash
led_dir="/sys/class/leds"
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
}

blink_leds() {
  if [$1 -eq 1]
  then
    cd $led_dir/beaglebone:green:usr0
    echo timer > trigger
    cd $led_dir/beaglebone:green:usr1
    echo timer > trigger
    cd $led_dir/beaglebone:green:usr2
    echo timer > trigger
    cd $led_dir/beaglebone:green:usr3
    echo timer > trigger
    echo "leds should be blinking..."
  else
    cd $led_dir/beaglebone:green:usr0
    echo heartbeat > trigger
    cd $led_dir/beaglebone:green:usr1
    echo heartbeat > trigger
    cd $led_dir/beaglebone:green:usr2
    echo heartbeat > trigger
    cd $led_dir/beaglebone:green:usr3
    echo heartbeat > trigger
    echo "leds should in heartbeat mode..."
  fi
}

display_current_running_proc
display_date_time_kernel
display_kernel_dump

VAR=${1:-0}  

blink_leds "$VAR"

# Log file path
LOG_FILE="my_script_log.txt"

# Redirect the output of functions to the log file
{
    echo "----- Log started: $(date) -----"

    # Function calls and store the output in the log file
   display_current_running_proc
   display_date_time_kernel
   display_kernel_dump

    echo "----- Log ended: $(date) -----"
} >> "$LOG_FILE"
