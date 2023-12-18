#!/usr/bin/pwsh
Write-Output 'content-type:text/html'
Write-Output ''
Write-Output  (invoke-WebRequest https://ifconfig.co/json).Content | ConvertFrom-Json | ConvertTo-Html | Write-Host
Write-Output ''