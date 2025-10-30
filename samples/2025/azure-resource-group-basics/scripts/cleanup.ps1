#!/usr/bin/env pwsh
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Import-Module Az.Resources -MinimumVersion 11.3.1 | Out-Null

$required = @('AZURE_SUBSCRIPTION_ID', 'RESOURCE_GROUP_NAME')
foreach ($var in $required) {
    if (-not $env:$var) {
        throw "Required environment variable '$var' is missing."
    }
}

Set-AzContext -SubscriptionId $env:AZURE_SUBSCRIPTION_ID | Out-Null

if (Get-AzResourceGroup -Name $env:RESOURCE_GROUP_NAME -ErrorAction SilentlyContinue) {
    Remove-AzResourceGroup -Name $env:RESOURCE_GROUP_NAME -Force -Confirm:$false
    Write-Host "Delete initiated for resource group '$env:RESOURCE_GROUP_NAME'." -ForegroundColor Yellow
} else {
    Write-Host "Resource group '$env:RESOURCE_GROUP_NAME' not found; nothing to delete." -ForegroundColor DarkGray
}
