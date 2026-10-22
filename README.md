# Project 6 — Nikto Web Server Security Checker

## Objective

Build a Bash utility that runs Nikto against a locally hosted test website and saves a security assessment report.

## Tools Used

- Ubuntu Linux
- Nikto
- Python 3 HTTP server
- Bash scripting
- curl

## Project Structure

- `nikto_checker.sh` — Runs the local security scan
- `README.md` — Project documentation
- `output.txt` — Terminal output from the scan
- `webroot/index.html` — Local test webpage
- `reports/nikto_report.txt` — Detailed scan report
- `screenshots/` — Project screenshots

## Installation

```bash
sudo apt update
sudo apt install nikto python3 curl
```

## Start the Local Test Server

```bash
python3 -m http.server 8000 --bind 127.0.0.1 --directory webroot
```

Keep the server running.

## Run the Checker

In a second terminal:

```bash
chmod +x nikto_checker.sh
./nikto_checker.sh
```

Save the terminal output:

```bash
./nikto_checker.sh 2>&1 | tee output.txt
```

## Learning Outcomes

- Web server security scanning
- Nikto usage
- Local web server testing
- Bash scripting
- Report generation
- Security finding interpretation

## Safety

This project scans only a locally hosted test server at `127.0.0.1:8000`. Scan external systems only with explicit authorization.

Nikto findings require verification and do not automatically prove that a vulnerability exists.

## Author

Surya Naidu
