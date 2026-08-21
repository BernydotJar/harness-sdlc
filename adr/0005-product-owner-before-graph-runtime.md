# ADR 0005: Establish Product Ownership Before Graph Execution

Status: Accepted for review
Date: 2026-08-20

## Context

I-DO has a broad ERP/SaaS vision, two initial jurisdictions, financial and legal risk, and no verified application source repository in the current workspace.

Graph Harness SDLC is valuable when work can be represented as typed, dependent, independently verifiable nodes. Introducing a graph before the product boundary, canonical financial model, country-pack contract, evidence requirements, and human gates are stable would encode uncertainty as execution structure and create expensive rework.

The linear `harness-sdlc` workflow already provides spec-driven delivery, role separation, human approval, SHIP gates, and persistent evidence for resolving foundational uncertainty one increment at a time.

## Decision

1. Add a reusable Product Owner role, discovery command, skill, and product templates to `harness-sdlc`.
2. Use the linear harness for I-DO product discovery and the first foundational SHIP specifications.
3. Keep the financial kernel country-neutral and place local requirements in effective-dated country packs.
4. Maintain a structured regulatory register with authoritative sources and professional gates.
5. Transition to Graph Harness SDLC only after the source repository is governed, canonical contracts are approved, at least three dependent SHIP specs exist, and every proposed graph node has verification and evidence contracts.
6. Treat Graph Harness as the execution runtime, not a replacement for product memory or human authority.

## Consequences

### Positive

- Reduces premature parallelism and structural rework.
- Makes legal, accounting, privacy, and release decisions explicit before implementation.
- Provides a reusable product-discovery capability for future products.
- Preserves a clean transition path to typed graph execution.

### Negative

- Delays visible application code while repository and product fundamentals are resolved.
- Requires disciplined human and professional decisions before country releases.
- Maintains two execution shapes over the product lifetime: linear discovery/foundation, then graph delivery.

## Rejected alternatives

### Start directly in Graph Harness SDLC

Rejected because the application repository, graph nodes, canonical entities, professional gates, and evidence contracts are not yet stable.

### Build a broad ERP MVP first

Rejected because financial and fiscal systems cannot safely defer correctness, security, audit, reconciliation, and operational controls to a later hardening phase.

### Fork separate products for Colombia and Guatemala

Rejected because it would duplicate the financial core and turn regulatory differences into long-term architectural divergence.
