Start-IISCommitDelay
$SKCICD = New-IISSite -Name SKCICD -BindingInformation "*:90:" -PhysicalPath "$env:systemdrive\inetpub\wwwroot\SKCICD" -Passthru
$SKCICD.Applications["/"].ApplicationPoolName = "SKCICDAppPool"
Stop-IISCommitDelay