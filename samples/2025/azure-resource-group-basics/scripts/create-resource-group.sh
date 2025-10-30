#!/usr/bin/env bash
set -euo pipefail

REQUIRED_VARS=(AZURE_SUBSCRIPTION_ID AZURE_LOCATION RESOURCE_GROUP_NAME)
for var in "${REQUIRED_VARS[@]}"; do
  if [[ -z "${!var:-}" ]]; then
    echo "[error] Required environment variable '$var' is missing." >&2
    exit 1
  fi
done

az account set --subscription "$AZURE_SUBSCRIPTION_ID" >/dev/null

IFS=',' read -r -a tag_pairs <<< "${RESOURCE_GROUP_TAGS:-}"
cli_args=(
  --name "$RESOURCE_GROUP_NAME"
  --location "$AZURE_LOCATION"
)

if [[ -n "${RESOURCE_GROUP_TAGS:-}" ]]; then
  clean_tags=()
  for pair in "${tag_pairs[@]}"; do
    pair_trimmed="${pair// /}"
    if [[ -n "$pair_trimmed" ]]; then
      clean_tags+=("$pair_trimmed")
    fi
  done
  if ((${#clean_tags[@]} > 0)); then
    cli_args+=(--tags "${clean_tags[@]}")
  fi
fi

az group create "${cli_args[@]}" --output jsonc

echo "Resource group state:" >&2
az group show --name "$RESOURCE_GROUP_NAME" --output table
