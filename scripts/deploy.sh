#!/usr/bin/env bash

# Run the installation script
ssh -o "StrictHostKeyChecking=no" $bs_user@$bs_host /var/www/booking-system/scripts/installStaging.sh