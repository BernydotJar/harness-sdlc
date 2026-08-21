# I-DO ERP Graph Transition Readiness

Status: **NOT_READY**
Assessed: 2026-08-20
Decision owner: Human product owner with engineering lead

## Required conditions

- [ ] Source application repository is identified and governed.
- [x] Initial product thesis and production-slice boundary are documented.
- [x] Canonical-core and country-pack direction is documented.
- [ ] Canonical entities and data contracts are approved.
- [ ] At least three dependent application SHIP increments have approved specs.
- [x] High-level dependency order is documented.
- [ ] Every proposed node has executable verification and evidence contracts.
- [ ] Human accounting, tax, privacy, security, and release gates are assigned to named owners.
- [ ] Failure, retry, rollback, remediation, and terminal semantics are approved for application workflows.
- [ ] No unresolved foundational decision would invalidate the graph.

## Evidence available

- Public product-surface audit
- Product North Star
- Product brief and capability map
- Release strategy
- Structured regulatory register for Colombia and Guatemala
- Open-decision register
- Reusable Product Owner role, command, skill, and templates

## Blocking conditions

1. The I-DO application repository and Firebase deployment ownership are unresolved.
2. Target customer and first-country launch sequence are hypotheses.
3. No application SHIP spec is approved.
4. Canonical financial entities and authority-adapter contracts are not yet reviewed.
5. Professional reviewers and release signatories are not assigned.

## Transition decision

Continue with the linear `harness-sdlc` workflow. Create and approve the repository/architecture baseline, multi-tenant authority foundation, and financial-kernel specifications before introducing graph execution.

Reassess after the blocking decisions and at least three dependent SHIP specs are approved. Graph Harness SDLC will then become the execution runtime for independently verifiable nodes, while these product artifacts remain the strategic source of truth.
