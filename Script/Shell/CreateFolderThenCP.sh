#!/bin/bash

# Create the backup directory if it doesn't exist
mkdir -p /security_202306

# Check if each file exists and copy it to the backup directory if it does
if [ -e /etc/security ]; then cp /etc/security /security_202306; fi
if [ -e /etc/pam.d/system-auth ]; then cp /etc/pam.d/system-auth /security_202306; fi
if [ -e /etc/login/defs ]; then cp /etc/login/defs /security_202306; fi
if [ -e /etc/passwd ]; then cp /etc/passwd /security_202306; fi
if [ -e /etc/snmp/snmpd.conf ]; then cp /etc/snmp/snmpd.conf /security_202306; fi
if [ -e /etc/profile ]; then cp /etc/profile /security_202306; fi

echo "Backup complete."