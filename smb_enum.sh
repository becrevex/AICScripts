#!/bin/bash

# SMB Enumeration Script
# Usage: ./smb_enum.sh <target-ip> <domain> <username> <password>
# Example: ./smb_enum.sh 192.168.1.100 WORKGROUP guest guest

TARGET=$1
DOMAIN=${2:-WORKGROUP}
USERNAME=${3:-guest}
PASSWORD=${4:-guest}

if [ -z "$TARGET" ]; then
    echo "Usage: $0 <target-ip> <domain> <username> <password>"
    exit 1
fi

echo "[*] Starting SMB Enumeration for $TARGET..."

# Check for required tools
for tool in nmap smbclient smbmap nmblookup polenum msfconsole; do
    if ! command -v $tool &> /dev/null; then
        echo "[!] $tool is not installed. Please install it and run the script again."
        exit 1
    fi
done

# 1. Nmap SMB Enumeration
echo "[*] Running Nmap SMB enumeration..."
nmap -p 139,445 --script=smb-enum-shares,smb-enum-users,smb-enum-groups,smb-enum-admins,smb-enum-sessions,smb-enum-policies -oN nmap_smb_enum_$TARGET.txt $TARGET

# 2. nmblookup - Query NetBIOS names
echo "[*] Running nmblookup for NetBIOS name resolution..."
nmblookup -A $TARGET | tee nmblookup_$TARGET.txt

# 3. SMBMap - Enumerate SMB Shares
echo "[*] Running SMBMap..."
smbmap -H $TARGET -u "$USERNAME" -p "$PASSWORD" | tee smbmap_$TARGET.txt

# 4. smbclient - List Shares & Access
echo "[*] Running smbclient to list available shares..."
smbclient -L //$TARGET -U "$USERNAME%$PASSWORD" | tee smbclient_shares_$TARGET.txt

# 5. polenum - Enumerate SMB Policy and Users (if available)
echo "[*] Running polenum..."
polenum --host $TARGET --username $USERNAME --password $PASSWORD | tee polenum_$TARGET.txt

# 6. Metasploit SMB Enumeration (Executed within Metasploit Framework)
echo "[*] Running Metasploit SMB enumeration..."
echo "
use auxiliary/scanner/smb/smb_enumshares
set RHOSTS $TARGET
run
use auxiliary/scanner/smb/smb_enumusers
set RHOSTS $TARGET
run
use auxiliary/scanner/smb/smb_enumusers_domain
set RHOSTS $TARGET
run
use auxiliary/scanner/smb/smb_enum_gpp
set RHOSTS $TARGET
run
use auxiliary/scanner/smb/smb_lookupsid
set RHOSTS $TARGET
run
exit
" > metasploit_smb_enum.rc

msfconsole -q -r metasploit_smb_enum.rc | tee metasploit_smb_enum_$TARGET.txt

echo "[*] SMB Enumeration Completed. Check output files for results."
