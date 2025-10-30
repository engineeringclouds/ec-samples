# EngineeringClouds Code Samples

EngineeringClouds blog posts often ship with runnable demos, CLI walk-throughs, or copy-paste snippets. This repository is the home for those companion assets so readers can clone, explore, and extend the code without piecing it together from the article itself.

## Repository Layout

- `samples/` - runnable, end-to-end examples grouped by year and blog post
- `snippets/` - small, copy-ready fragments that illustrate a concept
- `templates/` - starter scaffolds contributors can copy for new content
- `shared/` - reusable helpers, sample data, container images, and more
- `tools/` - automation scripts for linting, packaging, and validation
- `docs/` - contributor guides, architectural notes, design decisions
- `.github/` - issue templates, workflows, and automation metadata

Root-level docs:

- `CATALOG.md` - high-level index across samples and snippets
- `CONTRIBUTING.md` - how to add or modify content in this repo
- `CODE_OF_CONDUCT.md` - expected community behaviour
- `SECURITY.md` - disclosure process for vulnerabilities

## Getting Started

1. Install the language or tooling required by the sample you want to run (see that sample's `README.md` and `metadata.yaml`).
2. Clone this repository and change into the relevant sample directory.
3. Follow the setup instructions provided (for example `./setup.sh`, `./scripts/run.ps1`, or commands documented in the sample README).

Most samples include an `.env.example` file to document required environment variables. Copy it to `.env`, fill in credentials, and keep the `.env` file out of version control.

## Contributing

We welcome fixes, enhancements, and new samples. Before you begin:

- Read `CONTRIBUTING.md` for branching, testing, and documentation expectations.
- Use the folder structure in `templates/sample-template/` as a starting point.
- Run the linting and test workflows locally (for example `tools/check.sh` or language-specific commands) before opening a pull request.

## Relationship to engineeringclouds.io

The [engineeringclouds.io](https://engineeringclouds.io) Hugo site links directly to the examples stored here. Blog posts are written to stand alone, but they reference these samples for readers who want to dig deeper or reuse the code.

Updates to shared assets or tooling can affect multiple samples, so please coordinate large changes via an issue before starting the work.

## License

Unless otherwise noted, code in this repository is licensed under the MIT License. See `LICENSE` for details.
