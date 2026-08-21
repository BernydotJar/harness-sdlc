# I-DO ERP Release Strategy

Status: Review
Mode: SHIP
Last verified: 2026-08-20

## Release principle

I-DO will not ship a demo labeled as an ERP. It will ship a narrower production slice with production-grade correctness, security, operations, accessibility, evidence, and local professional review.

Product breadth is staged. Quality gates are not.

## Iteration 0 — Product control plane

Current iteration in `harness-sdlc`:

- audit the public product and available repositories;
- define the Product Owner role and discovery contract;
- establish the product thesis, capability map, financial invariants, regulatory register, release boundary, open decisions, and graph transition gate;
- avoid application code until the actual source repository is identified.

Exit criteria:

- product control-plane artifacts are reviewed;
- source repository and deployment owner are known or a new application repository is explicitly authorized;
- accountable owners exist for product, engineering, accounting/tax, privacy/legal, security, and operations.

## Iteration 1 — Linear harness SHIP specifications

Use `harness-sdlc` one increment at a time to remove foundational uncertainty.

Proposed sequence:

1. **Repository and architecture baseline**
   Verify source, deployment, current code, data, environments, secrets ownership, CI, and operational boundaries.

2. **Multi-tenant authority foundation**
   Tenant, organization, legal entity, identity, roles, segregation of duties, audit evidence, command idempotency, and support-access controls.

3. **Financial kernel**
   Chart of accounts, ledger, journal lifecycle, periods, fixed-precision money, dimensions, and financial invariants.

4. **Country-pack and fiscal-adapter contract**
   Effective-dated rules, canonical fiscal documents, authority commands, retries, contingencies, evidence, and reconciliation.

5. **First country release slice**
   Selected by human decision after customer and professional evidence. Includes AR/AP, sales/purchase fiscal flows, bank reconciliation, reports, operations, and local release gate.

6. **Second country pack**
   Implemented against the same contracts without modifying the core for country-specific convenience.

Each increment remains SHIP and needs security, data correctness, failure modes, observability, test depth, accessibility, operations, and release evidence.

## Iteration 2 — Graph Harness execution

Transition only after the graph readiness checklist passes.

Candidate graph workstreams after transition:

```text
SaaS foundation
  -> financial kernel
  -> canonical fiscal platform
       -> Colombia country pack
       -> Guatemala country pack
  -> AR/AP and bank reconciliation
  -> reporting and close
  -> production operations
  -> release gates per country
```

The graph must include producer, critic/red-team, fixer, independent verifier, release gate, persistent evidence, and localized repair semantics for every production node.

## First production slice definition

A release candidate is complete only when a real tenant can:

1. Configure a legal entity, fiscal identity, users, roles, approvals, chart of accounts, periods, and bank accounts.
2. Create or import customers, suppliers, sales/purchase documents, and bank statements.
3. Issue or process fiscal documents through the selected country integration with explicit success, rejection, contingency, and unknown states.
4. Approve and post balanced entries with immutable evidence and correction through reversal/adjustment.
5. Track receivables, payables, settlements, and reconciliations.
6. Produce reproducible core financial and exception reports.
7. Recover from provider failure, restore data, investigate an incident, and reconcile uncertain commands.
8. Receive human support under controlled, audited access.

## Entry gates for application implementation

- Target repository identified and clean baseline captured.
- Product owner and technical owner named.
- No unknown customer or production data is copied into a new environment.
- Architecture and data decisions are recorded.
- The selected feature has a complete SHIP spec and explicit human approval.
- Required professional reviewers are identified.

## Country release gates

- Official source register refreshed near release.
- Current technical schemas and validation rules pinned by version/effective date.
- Authority/provider test environment evidence retained.
- Contingency, rejection, cancellation, duplicate, timeout, and unknown-result scenarios tested.
- Accounting and tax treatment reviewed by a qualified local professional.
- Privacy, retention, transfer, and customer terms reviewed.
- Support runbooks, incident contacts, reconciliation queues, rollback/remediation, and customer communications proven.

## Rollout

- Internal synthetic-data environment
- Professional review environment
- Design-partner sandbox with no authority side effects where possible
- One controlled legal entity and country
- Monitored cohort expansion
- Second country only after the shared contracts remain stable

## Rollback and remediation

Financial and fiscal systems rarely support a simple code rollback after external effects. Every release must distinguish:

- software rollback;
- feature disablement;
- queued-command pause;
- external-effect reconciliation;
- accounting reversal or adjustment;
- fiscal note, cancellation, rejection, or contingency remediation;
- customer communication and professional escalation.

## Terminal states

- `COMPLETED` — released with all gates and evidence.
- `PARTIAL_WITH_DOCUMENTED_BLOCKERS` — useful non-production artifacts complete; remaining blockers have owner and resume condition.
- `SAFETY_STOP` — continued execution risks financial, legal, privacy, security, or data harm.
