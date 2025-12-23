#!/bin/bash
#Script that returns the current server status.
server_name=$(hostname)

function memoryCheck(){
    echo ""
        echo "The current memory usage on ${server_name} is: "
        echo ""
        top -l 1 -s 0 | head -n 10
        echo ""
}
memoryCheck