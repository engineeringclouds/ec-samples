#!/usr/bin/env bash
set -euo pipefail

REQUIRED_VARS=(AZURE_SUBSCRIPTION_ID RESOURCE_GROUP_NAME)
for var in "${REQUIRED_VARS[@]}"; do
  if [[ -z "${!var:-}" ]]; then
    echo "[error] Required environment variable '$var' is missing." >&2
    exit 1
  fi
done

az account set --subscription "$AZURE_SUBSCRIPTION_ID" >/dev/null

if az group show --name "$RESOURCE_GROUP_NAME" >/dev/null 2>&1; then
  az group delete --name "$RESOURCE_GROUP_NAME" --yes --no-wait
  echo "Delete initiated for resource group '$RESOURCE_GROUP_NAME'." >&2
else
  echo "Resource group '$RESOURCE_GROUP_NAME' not found; nothing to delete." >&2
fi
