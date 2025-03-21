# Folder Locker and Unlocker Script
# Usage: Lock or unlock a folder by restricting or granting access.

param (
    [string]$folderPath,
    [string]$action, # "lock" or "unlock"
    [switch]$h       # Help menu
)

# Display help menu if -h is used
if ($h) {
    Write-Host @"
Usage:
    To lock a folder:
        .\FolderLocker.ps1 -folderPath "C:\MySecretFolder" -action "lock"

    To unlock a folder:
        .\FolderLocker.ps1 -folderPath "C:\MySecretFolder" -action "unlock"

    To display this help menu:
        .\FolderLocker.ps1 -h
"@
    exit
}

# Check if the folder path is provided
if (-not $folderPath) {
    Write-Host "Please provide the folder path." -ForegroundColor Red
    exit
}

# Check if the folder exists
if (-not (Test-Path $folderPath)) {
    Write-Host "The folder does not exist." -ForegroundColor Red
    exit
}

# Function to lock the folder
function Lock-Folder {
    param (
        [string]$path
    )
    # Deny access to the folder for all users
    $acl = Get-Acl $path
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone", "FullControl", "Deny")
    $acl.SetAccessRule($rule)
    Set-Acl -Path $path -AclObject $acl
    Write-Host "Folder locked successfully! No one can access it now." -ForegroundColor Green
}

# Function to unlock the folder
function Unlock-Folder {
    param (
        [string]$path
    )
    # Remove the deny rule for all users
    $acl = Get-Acl $path
    $acl.Access | ForEach-Object {
        if ($_.IdentityReference -eq "Everyone" -and $_.FileSystemRights -eq "FullControl" -and $_.AccessControlType -eq "Deny") {
            $acl.RemoveAccessRule($_)
        }
    }
    Set-Acl -Path $path -AclObject $acl
    Write-Host "Folder unlocked successfully! Access restored." -ForegroundColor Green
}

# Perform the action
switch ($action.ToLower()) {
    "lock" {
        Lock-Folder -path $folderPath
    }
    "unlock" {
        Unlock-Folder -path $folderPath
    }
    default {
        Write-Host "Invalid action. Use 'lock' or 'unlock'." -ForegroundColor Red
    }
}
