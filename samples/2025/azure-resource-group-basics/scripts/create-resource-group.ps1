#!/usr/bin/env pwsh
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Import-Module Az.Resources -MinimumVersion 11.3.1 | Out-Null

$required = @('AZURE_SUBSCRIPTION_ID', 'AZURE_LOCATION', 'RESOURCE_GROUP_NAME')
foreach ($var in $required) {
    if (-not $env:$var) {
        throw "Required environment variable '$var' is missing."
    }
}

Set-AzContext -SubscriptionId $env:AZURE_SUBSCRIPTION_ID | Out-Null

$tags = @{}
if ($env:RESOURCE_GROUP_TAGS) {
    foreach ($pair in ($env:RESOURCE_GROUP_TAGS -split ',')) {
        $trim = $pair.Trim()
        if (-not [string]::IsNullOrEmpty($trim)) {
            $kv = $trim.Split('=', 2)
            if ($kv.Count -eq 2) {
                $tags[$kv[0].Trim()] = $kv[1].Trim()
            } else {
                $tags[$kv[0].Trim()] = $null
            }
        }
    }
}

$params = @{
    Name     = $env:RESOURCE_GROUP_NAME
    Location = $env:AZURE_LOCATION
}
if ($tags.Count -gt 0) {
    $params['Tag'] = $tags
}

$rg = New-AzResourceGroup @params
$rg | ConvertTo-Json -Depth 5
