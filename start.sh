#!/bin/bash

__run_cron() {
    echo "Running the run_cron function."
    crond -n
}

# Call all functions
__run_cron

