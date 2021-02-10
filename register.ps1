$content = 
'If((Get-PackageProvider | Where-Object{$_.Name -eq "Nuget"}) -eq $null){
    $null = Install-PackageProvider Nuget -ForceBootstrap -Force 
}

if (!(Get-PSRepository <REPOSITORY-NAME> -erroraction SilentlyContinue)){
    $null = Register-PSRepository -Name <REPOSITORY-NAME> -SourceLocation "<URL>" -InstallationPolicy Trusted
}'

$profileContent = Get-Content -Path $PSHOME\profile.ps1 -ErrorAction SilentlyContinue
$stringMatch = <REPOSITORY-NAME>

$ContentExists = $false
ForEach ($line in $profileContent) {
    if ($line -match $stringMatch) {
        $ContentExists = $true
    }
}

If ($ContentExists -eq $false) {
    If (Test-Path $PSHOME\profile.ps1) {
        Add-Content -Path $PSHOME\profile.ps1 -Value "`r`n$content"
    } Else {
        Set-Content -Path $PSHOME\profile.ps1 -Value $content
    }
} Else {

}
