#!/bin/bash
##
# Color Variables
##
green=$'\e[32m'
blue=$'\e[34m'
red=$'\e[31m'
clear=$'\e[0m'

##
##
# Color Functions
function ColorGreen(){
    echo -ne ${green}$1${clear}
    }
function ColorBlue(){
    echo -ne ${blue}$1${clear}
}

#!/bin/bash
#Script that returns the current server status.
server_name=$(hostname)

function memoryCheck(){
    echo ""
        echo "The current memory usage on ${server_name} is: "
        check_disk_usage
        check_cpu_usage
        check_memory_usage
        check_kernel_version
}

function check_disk_usage(){
    echo "Current Disk usage: "
    df -h
    echo ""
}

function check_cpu_usage(){
    echo "Current CPU usage: "
    top -l 1 | grep "CPU usage"
    echo ""

}

function check_memory_usage(){
    echo "Current RAM usage: "
    top -l 1 | grep PhysMem
    echo ""

}

function check_kernel_version(){
    echo "Exact Kernel version: "
    uname -r
    echo ""
}


function menu(){
    echo -ne "
    My First Mennu
    $(ColorGreen '1)') Check Disk Usage
    $(ColorGreen '2)') CPU load
    $(ColorGreen '3)') Memory load
    $(ColorGreen '4)') Kernel version
    $(ColorGreen '5)') Check All
    $(ColorGreen '0)') Exit
    $(ColorBlue 'Choose an option: ')"
        read a
        case $a in 
            1) check_disk_usage ; menu ;;
            2) check_cpu_usage ; menu;;
            3) check_memory_usage ; menu ;;
            4) check_kernel_version ; menu ;;
            5) memoryCheck ; menu ;;
                0) exit 0 ;;
                *) echo -e ${red}'Wrong Choice'${clear}; ;;
                esac

}
menu