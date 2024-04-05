#!/bin/bash

# Function to check if dirsearch is installed
check_dirsearch() {
    if ! command -v dirsearch &> /dev/null; then
        echo "Dirsearch is not installed. Installing..."
        sudo apt update
        sudo apt install -y dirsearch
    fi
}

# Function to check if sslscan is installed
check_sslscan() {
    if ! command -v sslscan &> /dev/null; then
        echo "SSLScan is not installed. Installing..."
        sudo apt update
        sudo apt install -y sslscan
    fi
}

# Function to perform TCP scan
perform_tcp_scan() {
    echo "Performing TCP scan..."
    read -p "Enter target IP address or domain name: " target
    sudo nmap -sS $target | tee tcp_scan_results.txt
    echo "TCP scan results saved to tcp_scan_results.txt"

    # Check if port 80 is open
    if grep -q "80/tcp.*open" tcp_scan_results.txt; then
        echo "Port 80 is open. Initiating dirsearch..."
        dirsearch $target
    else
        echo "Port 80 is not open. Skipping dirsearch scan."
    fi

    # Check if port 443 is open
    if grep -q "443/tcp.*open" tcp_scan_results.txt; then
        echo "Port 443 is open. Initiating sslscan..."
        sslscan $target
    else
        echo "Port 443 is not open. Skipping sslscan."
    fi

    # Check if port 21 (FTP) is open
    if grep -q "21/tcp.*open" tcp_scan_results.txt; then
        echo "Port 21 is open (FTP). Running Nmap FTP scripts..."
        sudo nmap --script ftp-* -p 21 $target
    fi
}

# Function to perform UDP scan
perform_udp_scan() {
    echo "Performing UDP scan..."
    read -p "Enter target IP address or domain name: " target
    sudo nmap -sU $target | tee udp_scan_results.txt
    echo "UDP scan results saved to udp_scan_results.txt"

    # Check if port 80 is open
    if grep -q "80/tcp.*open" udp_scan_results.txt; then
        echo "Port 80 is open. Initiating dirsearch..."
        dirsearch $target
    else
        echo "Port 80 is not open. Skipping dirsearch scan."
    fi

    # Check if port 443 is open
    if grep -q "443/tcp.*open" udp_scan_results.txt; then
        echo "Port 443 is open. Initiating sslscan..."
        sslscan $target
    else
        echo "Port 443 is not open. Skipping sslscan."
    fi

    # Check if port 21 (FTP) is open
    if grep -q "21/tcp.*open" udp_scan_results.txt; then
        echo "Port 21 is open (FTP). Running Nmap FTP scripts..."
        sudo nmap --script ftp-* -p 21 $target
    fi
}

# Function to perform version scan
perform_version_scan() {
    echo "Performing version scan..."
    read -p "Enter target IP address or domain name: " target
    sudo nmap -sV $target | tee version_scan_results.txt
    echo "Version scan results saved to version_scan_results.txt"

    # Check if port 80 is open
    if grep -q "80/tcp.*open" version_scan_results.txt; then
        echo "Port 80 is open. Initiating dirsearch..."
        dirsearch $target
    else
        echo "Port 80 is not open. Skipping dirsearch scan."
    fi

    # Check if port 443 is open
    if grep -q "443/tcp.*open" version_scan_results.txt; then
        echo "Port 443 is open. Initiating sslscan..."
        sslscan $target
    else
        echo "Port 443 is not open. Skipping sslscan."
    fi

    # Check if port 21 (FTP) is open
    if grep -q "21/tcp.*open" version_scan_results.txt; then
        echo "Port 21 is open (FTP). Running Nmap FTP scripts..."
        sudo nmap --script ftp-* -p 21 $target
    fi
}

# Function to perform version scan with port number
perform_version_scan_with_port() {
    echo "Performing version scan with port number..."
    read -p "Enter target IP address or domain name: " target
    read -p "Enter port number: " port
    sudo nmap -p $port -sV $target | tee version_scan_with_port_results.txt
    echo "Version scan with port number results saved to version_scan_with_port_results.txt"

    # Check if port 80 is open
    if grep -q "80/tcp.*open" version_scan_with_port_results.txt; then
        echo "Port 80 is open. Initiating dirsearch..."
        dirsearch $target
    else
        echo "Port 80 is not open. Skipping dirsearch scan."
    fi

    # Check if port 443 is open
    if grep -q "443/tcp.*open" version_scan_with_port_results.txt; then
        echo "Port 443 is open. Initiating sslscan..."
        sslscan $target
    else
        echo "Port 443 is not open. Skipping sslscan."
    fi

    # Check if port 21 (FTP) is open
    if grep -q "21/tcp.*open" version_scan_with_port_results.txt; then
        echo "Port 21 is open (FTP). Running Nmap FTP scripts..."
        sudo nmap --script ftp-* -p 21 $target
    fi
}

# Function to perform full port scan
perform_full_port_scan() {
    echo "Performing full port scan..."
    read -p "Enter target IP address or domain name: " target
    sudo nmap -p- $target | tee full_port_scan_results.txt
    echo "Full port scan results saved to full_port_scan_results.txt"

    # Check if port 80 is open
    if grep -q "80/tcp.*open" full_port_scan_results.txt; then
        echo "Port 80 is open. Initiating dirsearch..."
        dirsearch $target
    else
        echo "Port 80 is not open. Skipping dirsearch scan."
    fi

    # Check if port 443 is open
    if grep -q "443/tcp.*open" full_port_scan_results.txt; then
        echo "Port 443 is open. Initiating sslscan..."
        sslscan $target
    else
        echo "Port 443 is not open. Skipping sslscan."
    fi

    # Check if port 21 (FTP) is open
    if grep -q "21/tcp.*open" full_port_scan_results.txt; then
        echo "Port 21 is open (FTP). Running Nmap FTP scripts..."
        sudo nmap --script ftp-* -p 21 $target
    fi
}

# Function to perform time scan
perform_time_scan() {
    echo "Performing time scan..."
    read -p "Enter target IP address or domain name: " target
    sudo nmap -T4 $target | tee time_scan_results.txt
    echo "Time scan results saved to time_scan_results.txt"

    # Check if port 80 is open
    if grep -q "80/tcp.*open" time_scan_results.txt; then
        echo "Port 80 is open. Initiating dirsearch..."
        dirsearch $target
    else
        echo "Port 80 is not open. Skipping dirsearch scan."
    fi

    # Check if port 443 is open
    if grep -q "443/tcp.*open" time_scan_results.txt; then
        echo "Port 443 is open. Initiating sslscan..."
        sslscan $target
    else
        echo "Port 443 is not open. Skipping sslscan."
    fi

    # Check if port 21 (FTP) is open
    if grep -q "21/tcp.*open" time_scan_results.txt; then
        echo "Port 21 is open (FTP). Running Nmap FTP scripts..."
        sudo nmap --script ftp-* -p 21 $target
    fi
}

# Main script
echo "Welcome to Nmap Scanner Script!"

# Check if dirsearch is installed
check_dirsearch

# Check if sslscan is installed
check_sslscan

# Prompt user for the type of scan
echo "Choose the type of Nmap scan:"
echo "1. TCP scan"
echo "2. UDP scan"
echo "3. Version scan"
echo "4. Version scan with port number"
echo "5. Full port scan"
echo "6. Time scan"

read -p "Enter your choice: " choice

case $choice in
    1) perform_tcp_scan ;;
    2) perform_udp_scan ;;
    3) perform_version_scan ;;
    4) perform_version_scan_with_port ;;
    5) perform_full_port_scan ;;
    6) perform_time_scan ;;
    *) echo "Invalid choice. Exiting." ;;
esac
