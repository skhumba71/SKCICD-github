$aspNetRuntimeVersionString = $runtimes | where {$_ -match "AspNetCore\.App (6\.0\.\d)"} | %{ $Matches.1 } | Select -First 1
$desiredVersion = New-Object System.Version("6.0.9")
$actualVerison = New-Object System.Version("0.0.0.0")
$installRuntime = $true
if ([System.Version]::TryParse($aspNetRuntimeVersionString, [ref]$actualVerison)) {
  $installRuntime = $actualVersion -ge $desiredVersion
}
if ($installRuntime) {
	mkdir C:\DotNet
	Invoke-WebRequest -UseBasicParsing -Uri 'https://download.visualstudio.microsoft.com/download/pr/eaa3eab9-cc21-44b5-a4e4-af31ee73b9fa/d8ad75d525dec0a30b52adc990796b11/dotnet-hosting-6.0.9-win.exe' -OutFile C:\DotNet\aspdotnet-6.0-installer.exe
    Start-Process -Wait C:\DotNet\aspdotnet-6.0-installer.exe -ArgumentList '/install','/quiet','/norestart'
} else {
	echo 'ASP.NET Core 6.0.9XX or better detected.'
}