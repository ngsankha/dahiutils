#!/bin/sh

# @author     Vaibhav Mehta <vaibhav@decodingweb.com>
# @copyright  Copyright (c) 2016 Vaibhav Mehta <https://github.com/i-break-codes>
# @license    http://www.opensource.org/licenses/mit-license.html  MIT License

# Output Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"


# Expiration in n days
amulexpiresin=15
epigamiaexpiresin=14

currentdate=$(date +"%Y-%m-%d")

# Ask for brand
echo "Select Dahi Brand: ${RED}Amul${NC} / ${RED}Epigamia${NC}"
read brand

# Validate Brand
if [[ "$brand" -ne "Amul" || "$brand" -ne "Epigamia" ]] ;
then
  echo "No expiration check for ${brand}"
  exit 1
fi

# Ask for Manufacturing Date
echo "Enter Dahi Manufacturing Date : ${RED}(YYYY-MM-DD)${NC}"
read manufacturingdate

# Manufacturing Date + Expires In
# Thanks to @anirudha13
amulexpirydate=$(date -j -f %Y-%m-%d -v+${amulexpiresin}d $manufacturingdate +"%Y-%m-%d")
epigamiaexpirydate=$(date -j -f %Y-%m-%d -v+${epigamiaexpiresin}d $manufacturingdate +"%Y-%m-%d")

# Decide date to check (Includes expires in)
if [[ $brand == "Amul" ]] ;
then
  checkexpiryfor=$amulexpirydate
elif [[ $brand == "Epigamia" ]] ;
then
  checkexpiryfor=$epigamiaexpirydate
fi

# Check for Expiry
if [[ $checkexpiryfor < $currentdate ]] ;
then
  echo "${RED}Your ${brand} dahi is expired, blame your office (Script for blaming[Coming Soon])${NC}"
else
  echo "${GREEN}Your ${brand} dahi isn't expired, you can go to office :)${NC}"
fi