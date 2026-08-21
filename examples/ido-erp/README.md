# I-DO ERP Product Control Plane

This directory is a portable example of how `harness-sdlc` performs product discovery before application implementation.

It exists because the current public I-DO deployment communicates a broad AI-native ERP vision, while the accessible source repository and executable application architecture have not yet been identified.

## Mode

`SHIP`

This is not an MVP plan. It deliberately selects a narrower first release while retaining production-grade security, correctness, operability, accessibility, evidence, and professional review gates.

## Artifacts

- `product/public-surface-audit.md` — dated evidence about the current public deployment and unresolved source provenance.
- `product/product-brief.md` — problem, customers, outcomes, principles, and product boundary.
- `product/capability-map.md` — shared platform, financial core, country packs, integrations, and deferred modules.
- `product/release-strategy.md` — linear harness first, graph runtime second, with entry and exit gates.
- `product/regulatory-register.json` — structured, dated, source-backed requirements for Colombia and Guatemala.
- `product/open-decisions.md` — decisions that must be made by accountable humans or professionals.
- `product/graph-transition-readiness.md` — explicit assessment of whether graph execution is justified.

## Authority

These artifacts are product memory and discovery evidence. They do not authorize application code. The next application increment must be entered in the target repository's `feature_list.json`, specified, approved, implemented, verified, and reviewed in SHIP mode.

## Current blocker

The I-DO application source repository and deployment ownership are unresolved. No application code, database, infrastructure, or production configuration should be created in this framework repository as a substitute.
