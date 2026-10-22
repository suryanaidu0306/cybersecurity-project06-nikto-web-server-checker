#!/bin/bash

set -u

TARGET="http://127.0.0.1:8000"
REPORT="reports/nikto_report.txt"

echo "========================================"
echo "     NIKTO WEB SERVER SECURITY CHECKER"
echo "========================================"

echo "Target: $TARGET"
echo "Scope: Local test server only"
echo

# Check whether Nikto is installed
if ! command -v nikto >/dev/null 2>&1; then
    echo "Error: Nikto is not installed."
    exit 1
fi

# Check whether the local server responds
if ! curl --silent --fail --output /dev/null "$TARGET"; then
    echo "Error: Local test server is not responding."
    echo "Start the Python web server in Terminal 1."
    exit 1
fi

# Create the reports directory
mkdir -p reports

echo "Local web server is responding."
echo "Starting Nikto scan..."
echo

# Scan only the local test server
if nikto -host "$TARGET" -output "$REPORT" -Format txt; then
    echo
    echo "Scan finished."
    echo "Report saved to: $REPORT"
else
    echo
    echo "Nikto reported an execution error."
    echo "Check the terminal output and report file."
    exit 1
fi

echo
echo "========================================"
echo "Security check completed."
echo "========================================"
