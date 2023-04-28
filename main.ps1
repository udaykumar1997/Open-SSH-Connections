<#
   File: main.ps1
   Description: This script counts and displays the number of active SSL and SFTP connections on a Windows Server.

   Copyright 2023 Uday Adusumilli

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
#>

$watchingPort = 8000 #443
$sftpPort = 22

$connections = Get-NetTCPConnection -State Established

$watchingPortConnections = $connections | Where-Object { ($_.LocalPort -eq $watchingPort) -or ($_.RemotePort -eq $watchingPort) }
$sftpConnections = $connections | Where-Object { ($_.LocalPort -eq $sftpPort) -or ($_.RemotePort -eq $sftpPort) }

$numberOfWatchingPortConnections = @($watchingPortConnections).Count
$numberOfSftpConnections = @($sftpConnections).Count

$InternalIPs = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ne "Loopback Pseudo-Interface 1" -and $_.AddressFamily -eq "IPv4" }).IPAddress
$LastInternalIP = $InternalIPs[-1] # Select the last IP address from the list
Clear-Host
Write-Host "Internal IP Address is: $LastInternalIP"
Write-Host "External IP Address is: $($IP.ip)"
Write-Host "Number of active SSL connections: $numberOfWatchingPortConnections"
Write-Host "Number of active SFTP connections: $numberOfSftpConnections"

if ($numberOfWatchingPortConnections -gt 0) {
    Write-Host "`nSSL connection details:`n"
    $watchingPortConnections | Format-Table -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess
}

if ($numberOfSftpConnections -gt 0) {
    Write-Host "`nSFTP connection details:`n"
    $sftpConnections | Format-Table -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess
}
