# Samples

Runnable, end-to-end demos grouped by publication year and blog slug.

```
samples/
  2025/
    aks-custom-vnet/
      README.md
      metadata.yaml
      src/
      scripts/
```

Each sample folder should include:

- `README.md` explaining purpose, setup, validation, and cleanup steps.
- `metadata.yaml` describing links back to the blog post, owners, status, tags, and tooling requirements.
- Executable scripts for Unix (`.sh`) and Windows (`.ps1`) when applicable.
- Automated tests or smoke checks where feasible.

Mark any deprecated sample by setting `status: deprecated` in `metadata.yaml` and updating `CATALOG.md`.
