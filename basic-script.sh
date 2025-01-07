#!/bin/bash
# This is a simple Bash script to demonstrate basic concepts.

# Print a greeting message
echo "Welcome to the Age Calculator!"

# Ask for the user's name
echo -n "What is your name? "
read -r USER_NAME

# Use a variable to greet the user
echo "Hello, $USER_NAME! Nice to here from you."

echo -n "Please enter your date of birth (YYYY-MM-DD): "
read -r DOB

# Validate the input format using a regular expression
if ! [[ "$DOB" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Invalid date format. Please enter in YYYY-MM-DD format."
    exit 1
fi

# Extract year, month, and day from the entered DOB
DOB_YEAR=$(echo "$DOB" | cut -d'-' -f1)
DOB_MONTH=$(echo "$DOB" | cut -d'-' -f2)
DOB_DAY=$(echo "$DOB" | cut -d'-' -f3)

# Get the current date's year, month, and day
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)
CURRENT_DAY=$(date +%d)

# Calculate the age
AGE=$((CURRENT_YEAR - DOB_YEAR))

# Adjust age if the current month/day is before the birth month/day
if [[ "$CURRENT_MONTH" -lt "$DOB_MONTH" || ( "$CURRENT_MONTH" -eq "$DOB_MONTH" && "$CURRENT_DAY" -lt "$DOB_DAY" ) ]]; then
    AGE=$((AGE - 1))
fi

# Output the calculated age
echo "You are $AGE years old."

# Use a conditional statement
if [ "$AGE" -le 13 ]; then
    echo "You are classified as a Child."
elif [ "$AGE" -ge 14 ] && [ "$AGE" -le 19 ]; then
    echo "You are classified as a Teen."
elif [ "$AGE" -ge 20 ] && [ "$AGE" -le 55 ]; then
    echo "You are classified as an Adult."
else
    echo "You are classified as a Senior Citizen."
fi

# Show the current date and time
echo "By the way, the current date and time is: $(date)"

# End the script
echo "Thanks for trying this script, $USER_NAME! Goodbye!"

