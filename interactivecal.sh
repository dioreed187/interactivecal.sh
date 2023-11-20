#!/bin/bash

# Simple Bash Calendar Scheduling Script

# Path to the events file
events_file="events.txt"

# Function to display the calendar
display_calendar() {
    cal
}

# Function to display events for a specific date
display_events() {
    date=$1
    echo "Events for $date:"
    grep "^$date" "$events_file" | cut -d' ' -f2-
}

# Function to add an event
add_event() {
    read -p "Enter date (YYYY-MM-DD): " date
    read -p "Enter event description: " description

    # Append the event to the events file
    echo "$date $description" >> "$events_file"
    echo "Event added successfully."
}

# Main loop
while true; do
    echo "1. Display Calendar"
    echo "2. Display Events"
    echo "3. Add Event"
    echo "4. Exit"
    read -p "Enter your choice (1-4): " choice

    case $choice in
        1)
            display_calendar
            ;;
        2)
            read -p "Enter date (YYYY-MM-DD): " date
            display_events "$date"
            ;;
        3)
            add_event
            ;;
        4)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac
done
