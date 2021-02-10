$content = Get-Content -Path $PSHOME\profile.ps1 -ErrorAction SilentlyContinue
$stringMatch = 'AzureDevOpsPublic'

$ContentExists = $false
ForEach ($line in $content) {
    if ($line -match $stringMatch) {
        $ContentExists = $true
    }
}

If ($ContentExists){
    Write-Host "Installed"
}
Else {
}