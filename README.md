```
#!/bin/bash

# Check if argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <execution_id>"
    exit 1
fi

# Get the execution_id
execution_id=$1

# Trigger Python script
python3 download_files.py "$execution_id"

```
#!/usr/bin/env python3
import os
import sys
import threading
from concurrent.futures import ThreadPoolExecutor
import database_functions

# Function to download a file
def download_file(filename):
    # Download logic here
    print(f"Downloading {filename}...")
    # Simulating download process
    # Assuming download logic here
    print(f"Downloaded {filename}")

# Function to handle downloading files
def handle_download(execution_id):
    # Retrieve filenames from the database based on execution_id
    filenames = database_functions.retrieve_filenames(execution_id)

    # Download files in parallel
    with ThreadPoolExecutor(max_workers=2) as executor:
        executor.map(download_file, filenames)

    # Make a call to update the database (assuming update function exists)
    database_functions.update_database(execution_id)

if __name__ == "__main__":
    # Check if execution_id is provided as argument
    if len(sys.argv) != 2:
        print("Usage: python3 download_files.py <execution_id>")
        sys.exit(1)

    execution_id = sys.argv[1]

    # Call function to handle download process
    handle_download(execution_id)

```
