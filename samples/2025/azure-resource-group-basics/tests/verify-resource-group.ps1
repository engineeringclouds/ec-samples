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

$rg = Get-AzResourceGroup -Name $env:RESOURCE_GROUP_NAME -ErrorAction Stop
$rg | Select-Object ResourceGroupName, Location, Tags | Format-List
