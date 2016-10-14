#!/bin/sh

# DOD - Dahi of the Day
# @author     Vaibhav Mehta <vaibhav@decodingweb.com>
# @copyright  Copyright (c) 2016 Vaibhav Mehta <https://github.com/i-break-codes>
# @license    http://www.opensource.org/licenses/mit-license.html  MIT License

# Output Colors
GREEN="\033[0;32m"
NC="\033[0m"

# List of Dahi brands
brands=("Mother Dairy" "Amul" "Epigamia" "Nestle" "Britannia")
rand=$[$RANDOM % 5]

# DOD
echo "Dahi of the day is ${GREEN}${brands[$rand]}${NC}, stay healthy"