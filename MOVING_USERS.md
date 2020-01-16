# Moving the Users directory to another drive

I currently have an SSD, where I install Windows and programs, and an HDD, where I save my data. The Windows setup doesn't provide a setting to change the user profiles directory, but we can use Sysprep during install to move the `Users` directory to another drive.

_Credits: https://www.tenforums.com/tutorials/1964-move-users-folder-location-windows-10-a.html_

When installation reaches **Region Selection**, press **Ctrl + Shift + F3**.

Next, click `Cancel`. Open `notepad` and introduce the following:

```xml
<?xml version="1.0" encoding="utf-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
<settings pass="oobeSystem">
<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<FolderLocations>
<ProfilesDirectory>D:\Users</ProfilesDirectory>
</FolderLocations>
</component>
</settings>
</unattend>
```

Save the file to `D:\relocate.xml` and open an **elevated** command prompt. Finally, run the following:

```bat
net stop wmpnetworksvc

%windir%\system32\sysprep\sysprep.exe /oobe /reboot /unattend:d:\relocate.xml
```

After some minutes you will be in OOBE first run boot, where you will be able to proceed with the installation as normal.