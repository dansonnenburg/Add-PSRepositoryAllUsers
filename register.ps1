$content = 
'If((Get-PackageProvider | Where-Object{$_.Name -eq "Nuget"}) -eq $null){
    $null = Install-PackageProvider Nuget -ForceBootstrap -Force 
}

if (!(Get-PSRepository AzureDevOpsPublic -erroraction SilentlyContinue)){
    $null = Register-PSRepository -Name AzureDevOpsPublic -SourceLocation "https://croppdevops.pkgs.visualstudio.com/Public/_packaging/Packages/nuget/v2/" -InstallationPolicy Trusted
}'

$profileContent = Get-Content -Path $PSHOME\profile.ps1 -ErrorAction SilentlyContinue
$stringMatch = 'AzureDevOpsPublic'

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