# My boxstarter scripts

Just my bostarter scripts to set up different Windows Machines. The idea is to use it a few times, so I will update it when I need it.

## Usage

Installing boxstarter.
``` PowerShell
. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force
```

Executing the script.
``` PowerShell
Install-BoxstarterPackage -PackageName RAW_SCRIPT_FILE -DisableReboots
```