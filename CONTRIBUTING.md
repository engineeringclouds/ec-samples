# Contributing to EngineeringClouds Code Samples

Thanks for helping improve the companion code for the EngineeringClouds blog! This guide walks you through the expectations for proposing changes or submitting new samples.

## Project Structure

- `samples/<year>/<blog-slug>/` contains runnable demos tied to specific posts.
- `snippets/<language>/<topic>/` holds small, copy-ready fragments.
- `templates/sample-template/` is the scaffold you should copy when adding a new sample.
- `shared/` and `tools/` provide reusable helpers. Update these cautiously since multiple samples may rely on them.

## How to Propose Changes

1. **Discuss first (recommended):** Open an issue describing the problem or enhancement. Link to the associated blog post if relevant.
2. **Create a branch:** Use a descriptive name such as `feature/2025-aks-cli-sample` or `fix/update-terraform-version`.
3. **Develop locally:** Follow the instructions in the relevant sample `README.md`. If you create new assets, copy the template and fill in the metadata file before writing code.
4. **Document everything:** Update `README.md`, `metadata.yaml`, and any automation configuration so others can run your contribution.
5. **Add tests or validation:** Execute the sample-specific tests and any repo-wide tooling under `tools/`. Include new tests when you add functionality.
6. **Open a pull request:** Reference the issue (if any), describe what changed, list validation steps, and call out breaking changes.

## Adding a New Sample

1. Copy `templates/sample-template/` to `samples/<year>/<blog-slug>/`.
2. Update the new `README.md` with:
   - Summary of what the sample demonstrates.
   - Links back to the blog post.
   - Prerequisites, setup instructions, verification steps, and cleanup guidance.
3. Fill in `metadata.yaml` with owner, status, tags, and documentation URLs.
4. Provide runnable scripts (`run.sh`, `run.ps1`, `Makefile`, etc.) and include an `.env.example` if secrets are required.
5. Add automated tests or smoke checks whenever possible.

## Coding and Documentation Standards

- Keep scripts idempotent and safe to run multiple times.
- Use ASCII characters unless a dependency or upstream API requires Unicode.
- Include short explanatory comments only when the intent is not immediately obvious.
- Adhere to language-specific formatting tools (for example `black`, `gofmt`, `prettier`).

## Testing

- Execute `tools/check.sh` (or the equivalent commands listed in the repository root) before submitting a PR.
- Run sample-specific unit/integration tests and document the results in the PR description.
- For CLI samples, demonstrate both Unix and Windows (PowerShell) flows when applicable.

## Pull Request Checklist

- [ ] Linked issue (if applicable)
- [ ] Updated documentation (`README.md`, `metadata.yaml`, `CATALOG.md`)
- [ ] Added or updated tests/validation scripts
- [ ] Ran repo/tool-specific checks
- [ ] Ensured secrets are not committed

## Questions

Open a discussion or issue if you are unsure how to structure a contribution. For private topics (such as security reports), follow the guidance in `SECURITY.md`.
