# Installs PowerShell 7
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -quiet"

# Runs our deployment script
pwsh -executionpolicy unrestricted -file "C:\Users\WDAGUtilityAccount\Downloads\sandbox\sandbox_prereqs.ps1"
