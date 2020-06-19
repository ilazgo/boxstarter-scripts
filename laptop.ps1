# Boxstarter script for my laptop.

Update-ExecutionPolicy Unrestricted

# Temporary
Disable-UAC

# Windows configuration
Disable-InternetExplorerESC
Disable-BingSearch
Enable-RemoteDesktop
Set-WindowsExplorerOptions -EnableShowFileExtensions
Set-BoxstarterTaskbarOptions -Size Small -Dock Bottom -Combine Always -Lock

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