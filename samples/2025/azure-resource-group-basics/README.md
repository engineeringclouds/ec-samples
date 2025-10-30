# Azure Resource Group Basics (Azure CLI & PowerShell)

Create and clean up an Azure resource group using both the Azure CLI and the Az PowerShell module. This sample mirrors the foundational steps referenced in the EngineeringClouds blog post and provides cross-platform scripts for Bash and PowerShell users.

## Prerequisites

- Azure subscription with permissions to create resource groups.
- Azure CLI 2.60.0 or later (`az --version`).
- Az PowerShell module 11.3.1 or later (`Get-Module Az.Resources`).
- Logged in via `az login` or `Connect-AzAccount`.
- `AZURE_SUBSCRIPTION_ID`, `AZURE_LOCATION`, and `RESOURCE_GROUP_NAME` exported via `.env` (see `.env.example`).

> The commands used here are based on Microsoft Learn guidance for [managing resource groups with Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-cli) and [creating resource groups with Az PowerShell](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup).

## Setup

1. Copy `.env.example` to `.env` and populate the values.
2. Source the environment variables in your shell:
   
   ```bash
   export $(grep -v '^#' .env | xargs)
   ```

   In PowerShell:
   
   ```powershell
   Get-Content .env | Where-Object { $_ -and -not $_.StartsWith('#') } | ForEach-Object {
     $name, $value = $_.Split('=', 2)
     Set-Item -Path env:$name -Value $value
   }
   ```

3. Ensure the target subscription is selected:
   
   ```bash
   az account set --subscription "$AZURE_SUBSCRIPTION_ID"
   ```
   
   ```powershell
   Set-AzContext -SubscriptionId $env:AZURE_SUBSCRIPTION_ID
   ```

## Run with Azure CLI (Bash)

```bash
./scripts/create-resource-group.sh
```

The script performs the following:

- Validates required environment variables.
- Creates the resource group with `az group create`.
- Applies optional tags if `RESOURCE_GROUP_TAGS` is provided.
- Showcases idempotent behavior (running again reaffirms existing state).

## Run with Az PowerShell

```powershell
./scripts/create-resource-group.ps1
```

This script:

- Ensures the Az.Resources module is loaded.
- Calls `New-AzResourceGroup` to create the group.
- Applies tags when configured.
- Emits JSON output summarizing the created group.

## Validate

### Bash

```bash
./tests/verify-resource-group.sh
```

### PowerShell

```powershell
./tests/verify-resource-group.ps1
```

Both scripts check that the resource group exists and display its location and tags. They exit with a non-zero status if the group is missing.

## Cleanup

Remove the resource group to avoid ongoing charges:

```bash
./scripts/cleanup.sh
```

or

```powershell
./scripts/cleanup.ps1
```

Cleanup scripts call `az group delete` / `Remove-AzResourceGroup` with confirmation suppressed. Double-check the environment variables before running.

## Next Steps

- Extend the sample by deploying a template with `az deployment group create` or `New-AzResourceGroupDeployment`.
- Experiment with resource locks and tagging strategies as outlined in the Microsoft Learn articles linked above.
- Update `CATALOG.md` with this sample’s metadata when publishing.
