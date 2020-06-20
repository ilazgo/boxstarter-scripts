# Boxstarter script for my laptop.

Update-ExecutionPolicy Unrestricted

# Temporary
Disable-UAC

# Windows configuration
Disable-InternetExplorerESC
Disable-BingSearch
Enable-RemoteDesktop
Set-WindowsExplorerOptions -EnableShowFileExtensions
#Set-BoxstarterTaskbarOptions -Size Small -Dock Bottom -Combine Always -Lock

# Uninstall bloatware
Get-AppxPackage -AllUsers *Office* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Access* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Excel* | Remove-AppxPackage
Get-AppxPackage -AllUsers *OneNote* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Outlook* | Remove-AppxPackage
Get-AppxPackage -AllUsers *PowerPoint* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Publisher* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Word* | Remove-AppxPackage

Get-AppxPackage -AllUsers *BubbleWitch* | Remove-AppxPackage
Get-AppxPackage -AllUsers *CandyCrush* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Solitaire* | Remove-AppxPackage

Get-AppxPackage -AllUsers Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Feedback | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.GetHelp | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.Messaging | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.MixedReality.Portal | Remove-AppxPackage
Get-AppxPackage -AllUsers *Groove* | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.MovieMoments | Remove-AppxPackage
Get-AppxPackage -AllUsers *Skype* | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage

Get-AppxPackage -AllUsers Microsoft.3DBuilder | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage -AllUsers *McAfee* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Netflix* | Remove-AppxPackage

# Remove OneDrive
if (Test-Path "$env:systemroot\System32\OneDriveSetup.exe") {
    & "$env:systemroot\System32\OneDriveSetup.exe" /uninstall
}
if (Test-Path "$env:systemroot\SysWOW64\OneDriveSetup.exe") {
    & "$env:systemroot\SysWOW64\OneDriveSetup.exe" /uninstall
}

rm -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
rm -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
rm -Recurse -Force -ErrorAction SilentlyContinue "C:\OneDriveTemp"

New-PSDrive -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" -Name "HKCR"
mkdir -Force "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
sp "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" "System.IsPinnedToNameSpaceTree" 0
mkdir -Force "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
sp "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" "System.IsPinnedToNameSpaceTree" 0
Remove-PSDrive "HKCR"

rm -Force -ErrorAction SilentlyContinue "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"

Get-ScheduledTask -TaskPath '\' -TaskName 'OneDrive*' -ea SilentlyContinue | Unregister-ScheduledTask -Confirm:$false

# Remove McAffe
Get-AppxPackage *McAfee* | Remove-AppxPackage
$mcafee = gci "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match "McAfee Security" } | select UninstallString
if ($mcafee) {
    $mcafee = $mcafee.UninstallString -Replace "C:\Program Files\McAfee\MSC\mcuihost.exe",""
    Write "Uninstalling McAfee..."
    start-process "C:\Program Files\McAfee\MSC\mcuihost.exe" -arg "$mcagfee" -Wait
}

# Install apps
cinst 7zip.install
cinst bleachbit
cinst firefox
cinst keepassxc
cinst libreoffice-fresh
cinst notepadplusplus.install
cinst spotify
cinst steelseries-engine
cinst cloudstation
cinst vlc
cinst microsoft-windows-terminal

# Rename the computer name
$computername = "kemurdbhian"
if ($env:computername -ne $computername) {
    Rename-Computer -NewName $computername
}

# Post
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula