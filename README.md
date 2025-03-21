# Folder Lock/Unlock Script:
Folder Lock/Unlock Script is A Tool Made For Security And For Educational Purposes Only On How A Malware Can Lock A Dir. Folder Lock/Unlock Tool is Used To Prevent Other People From Accessing A folder Like You Can Put Anything in A Folder And To Lock it Open Powershell By Pressing Win+r and type powershell and hit enter.

# How To Lock/Unlock A Folder:

# To Lock A Folder Type in Powershell:
```
powershell -ExecutionPolicy Bypass -File "C:\Path\To\FolderLocker.ps1" -folderPath "C:\Path\To\Folder" -action "lock"

```

# To Unlock A Folder Type in Powershell:
```
powershell -ExecutionPolicy Bypass -File "C:\Path\To\FolderLocker.ps1" -folderPath "C:\Path\To\Folder" -action "unlock"

```

# To View The Help Menu Type in Powershell:
```
powershell -ExecutionPolicy Bypass -File "C:\Path\To\FolderLocker.ps1" -h

```
# EXAMPLE:
Lock : 
```
powershell -ExecutionPolicy Bypass -File "C:\Users\windows\Desktop\Folder_locker\FolderLocker.ps1" -folderPath "F:\My_info" -action "lock"

```
Unlock :
```
powershell -ExecutionPolicy Bypass -File "C:\Users\windows\Desktop\Folder_locker\FolderLocker.ps1" -folderPath "F:\My_info" -action "unlock"

```
