<#
Digispot-SetFolderPermissions.ps1

v1.00 2018-06-07 Initial release
v1.01 2018-08-24 Rewritten on PowerShell

.NOTES
    Copyright (c) Roman Ermakov <r.ermakov@emg.fm>
    Use of this sample source code is subject to the terms of the
    GNU General Public License under which you licensed this sample source code. If
    you did not accept the terms of the license agreement, you are not
    authorized to use this sample source code.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    THIS CODE IS PROVIDED "AS IS" WITH NO WARRANTIES.
    
.SYNOPSIS
    Set full ACL Permissions for .\Users local group to Digispot II installation folder.
    Run this script after initial Digispot II installation or anytime you need to set full ACL.

.DESCRIPTION
    Set full ACL Permissions for .\Users local group to Digispot II installation folder.
    Run this script after initial Digispot II installation or anytime you need to set full ACL.

.EXAMPLE
    .\SetACL-Digispot.ps1

.PARAMETER None
    None

.OUTPUTS
    None
#>

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    # Relaunch as an elevated process:
    Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
    exit
}
# Now running elevated:

if ([Environment]::Is64BitProcess) {
    $p = ${env:ProgramFiles(x86)} + '\Digispot II'
} else {
    $p = $env:ProgramFiles + '\Digispot II'
}

Write-Host
Write-Host "Digispot-SetPermissions"
Write-Host "Set full ACL Permissions for .\Users local group to Digispot II installation folder."
Write-Host

$user = '.\Users'
$acl = Get-ACL -Path $p
$new = $user,'FullControl','ContainerInherit,ObjectInherit','None','Allow'
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $new
$acl.AddAccessRule($accessRule)
$acl | Set-ACL -Path $p -Verbose
Write-Host -NoNewLine 'Press any key to continue.';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
