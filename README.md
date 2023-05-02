# Active SSL and SFTP Connections PowerShell Script

This PowerShell script is designed to help you monitor the number of active SSL and SFTP connections on a Windows Server. It filters the results based on the default port numbers for SSL (port 443) and SFTP (port 22) and provides the count and details of the connections.

## Features

Counts and displays the number of active SSL and SFTP connections
Searches both LocalPorts and RemotePorts for the respective port numbers
Provides a detailed list of connections, including:
LocalAddress
LocalPort
RemoteAddress
RemotePort
State
OwningProcess

## Prerequisites

PowerShell (built-in to Windows)
Administrator access on the Windows Server to get accurate results

## Usage

Clone or download the script to your local machine or Windows Server.
Open PowerShell with administrative privileges (right-click on the PowerShell icon and select "Run as administrator").
Navigate to the directory where you saved the script.
Run the script by typing .\script_name.ps1 and press Enter (replace "script_name" with the actual file name).
The script will output the count of active SSL and SFTP connections, as well as a detailed list of connection information.

## Customization

If you are using custom port numbers for SSL or SFTP, you can adjust the $sslPort and $sftpPort variables in the script to match your configuration:
$watchingPort = Your_Custom_Port
$sftpPort = Your_Custom_SFTP_Port
Replace Your_Custom_SSL_Port and Your_Custom_SFTP_Port with your custom port numbers.

## Disclaimer
This script is provided "as is" without any warranty or guarantee. Use it at your own risk. Always test scripts in a safe environment before using them in production.