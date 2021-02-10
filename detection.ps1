$content = Get-Content -Path $PSHOME\profile.ps1 -ErrorAction SilentlyContinue
$stringMatch = <REPOSITORY-NAME>

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
