<#	
	.NOTES
	===========================================================================
	 Created with: 	BIG Capacitate mentala, Ciprian LUP BATRAN
     Supervised by: George The OLD OFFICER
	 Created on:   	11/6/2024 8:41 PM
	 Created by:   	Johnny the Great Dolphin SS3
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

#Set-Variable ProgressPreference SilentlyContinue
$PHISH_URL_DONT_CLICK = "https://www.youtube.com/watch?v=iCPP3BNc6yY"

Write-Host "Created with: 	BIG Capacitate mentala
            Supervised by: George The OLD OFFICER
	        Created on:   	11/6/2024 8:41 PM
	        Created by:   	Johnny the Great Dolphin SS3, Ciprian LUP BATRAN"

# Create an array whose elements are hashtables.
$appArray = (
	@{
		App = ($thisApp = 'Thunderbird')
		App_source = 'https://download.mozilla.org/?product=thunderbird-128.4.1esr-msi-SSL&os=win64&lang=en-US'
		Destination = "c:\Deploy_Startup\$thisApp.msi"
		Argument = '/quiet'
	},
	@{
		App = ($thisApp = 'LibreOffice')
		App_source = 'https://download.documentfoundation.org/libreoffice/stable/24.8.2/win/x86_64/LibreOffice_24.8.2_Win_x86-64.msi'
		Destination = "c:\Deploy_Startup\$thisApp.msi"
		Argument = '/quiet'
	}
	
)

foreach ($app in $appArray)
{
	# Note how $app.<key> is used to refer to the entries of the hashtable at hand,
	# e.g. $app.App yields "Firefox" for the first hashtable.
	$installed = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match $app.App }
	$installed.displayname
	if ($installed.displayname -Match $app.App)
	{
		Write-Host "$($app.App) already installed."
	}
	else
	{
		if ((Test-Path $app.Destination) -eq $false)
		{
			New-Item -ItemType File -Path $app.Destination -Force
		}
		
		#install software
		Write-Host "Downloading $($app.App)..."
		(new-object Net.WebClient).DownloadFile($app.App_source, $app.Destination)
		Write-Host "Installing $($app.App)..."
		Start-Process -FilePath $app.Destination -ArgumentList $app.Argument -Wait
		#Delete installer
        Write-Host "Deleting $($app.App)..."
		Remove-Item -Recurse $app.Destination
	}
}