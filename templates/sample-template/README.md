# Sample Template

Use this template as the starting point for a new runnable sample.

## Directory Layout

```
sample-template/
  README.md
  metadata.yaml
  .env.example
  src/
  scripts/
    run.sh
    run.ps1
  tests/
    README.md
```

## What to Update

1. **Rename the folder** to match your blog post slug (for example `2025/aks-resource-demo`).
2. Replace the content of this `README.md` with:
   - Overview of what the sample demonstrates.
   - Links back to the blog article and docs.
   - Prerequisites (CLIs, SDKs, accounts) and estimated runtime.
   - Setup, execution, validation, and cleanup steps.
3. Fill in `metadata.yaml` with accurate metadata.
4. Update the scripts (`run.sh`, `run.ps1`) with the real commands.
5. Add code to `src/` as needed.
6. Provide tests or smoke checks under `tests/`.

## Checklist Before Opening a PR

- [ ] README covers purpose, setup, validation, cleanup.
- [ ] metadata.yaml includes owner, tags, links, and maintenance status.
- [ ] Scripts support both Bash and PowerShell when practical.
- [ ] `.env.example` documents every required environment variable.
- [ ] Tests or verification steps are provided.
- [ ] Sample runs cleanly using the documented steps.
