# 008-product-owner-control-plane Requirements

## Summary

Create a reusable Product Owner capability in `harness-sdlc` and instantiate an evidence-backed SHIP product control plane for I-DO ERP.

The feature defines product ownership, separates product discovery from implementation authority, records the current public-product and repository reality, establishes a finance-centered SaaS boundary, creates initial Colombia and Guatemala regulatory requirements, and defines the gate for later Graph Harness SDLC execution.

## Mode

SHIP

This is a production-governance increment. It does not implement or deploy the I-DO application.

## Human Scope Authorization

The human product owner explicitly requested on 2026-08-20:

- creation of a Product Owner agent;
- use of `harness-sdlc` before `Graph-harness-sdlc`;
- SHIP mode rather than MVP;
- a real SaaS direction;
- finance and legal good practices;
- multi-country architecture beginning with Colombia and Guatemala.

This authorization covers reversible repository documentation, role, command, skill, template, validation, branch, commit, and draft-review artifacts. It does not authorize application code, deployment, paid resources, schema changes, fiscal submissions, legal conclusions, or production data access.

## Acceptance Criteria

- [x] A reusable `.claude/agents/product-owner.md` role exists with mission, responsibilities, financial invariants, country-pack rules, graph gate, prohibitions, and stop conditions.
- [x] A file-bounded product-discovery command exists and includes all required command-contract headings.
- [x] A reusable product-discovery skill and product templates exist.
- [x] I-DO has a dated public-surface audit that records method, evidence, limitations, and the source-provenance blocker.
- [x] I-DO has a strategic North Star that distinguishes public positioning from verified implementation.
- [x] I-DO has a product brief, capability map, release strategy, open-decision log, and graph-transition assessment.
- [x] The first release is defined as a thin but complete production slice, not an MVP or an all-modules rewrite.
- [x] Financial safety invariants include balanced double-entry, immutable posted entries, fixed-precision money, period controls, segregation of duties, idempotency, reconciliation, and human approval for consequential AI effects.
- [x] Colombia and Guatemala are modeled as versioned country packs around a canonical financial core.
- [x] A machine-readable regulatory register includes both jurisdictions, authoritative source URLs, verification dates, product implications, owners, and professional gates.
- [x] The Graph transition is explicitly `NOT_READY` until repository, contracts, specs, verification, and human/professional gates are stable.
- [x] The Leader routes broad product mandates to Product Owner discovery before specification.
- [x] The existing harness routes Product Owner work without bypassing Spec Author, Implementer, Reviewer, Production Reviewer, or human approval.
- [x] Independent review confirms scope, source quality, lifecycle integrity, and SHIP readiness of the control-plane increment.

## Non-Goals

- Do not implement I-DO application code.
- Do not create a new production application repository implicitly inside the framework repo.
- Do not deploy or modify the Firebase project.
- Do not select a cloud, identity provider, database, fiscal provider, certifier, PSP, or paid service.
- Do not certify legal, tax, accounting, labor, payroll, privacy, security, or fiscal compliance.
- Do not implement Colombia DIAN or Guatemala FEL integrations.
- Do not activate Graph Harness SDLC for I-DO yet.
- Do not include every ERP module in the first production slice.

## i18n

This increment creates developer and product-governance artifacts rather than an end-user UI.

Future I-DO user-facing specs must require:

- Spanish-first copy for Colombia and Guatemala;
- English-ready message and layout architecture;
- locale-aware dates, numbers, currencies, identifiers, addresses, and validation;
- accessible labels, errors, empty states, keyboard behavior, and assistive-technology semantics;
- country terminology supplied by the applicable country pack.

## SHIP Criteria

### Security

- No secrets, credentials, production data, personal data, or privileged URLs are added.
- Consequential AI and financial actions require explicit human authority.
- Tenant isolation, access, support, and evidence requirements are product gates.

### Data correctness

- Financial invariants and jurisdiction/effective-date boundaries are explicit.
- Regulatory claims retain source and verification metadata.
- Facts, inferences, hypotheses, and decisions are distinguished.

### Performance

- No runtime performance claim is made without application architecture.
- Future specs must define fiscal-provider latency, timeout, retry, queue, and reconciliation budgets.

### Failure modes

- Unknown external outcomes, duplicate risk, rejection, contingency, rollback, reversal, and remediation are explicit product requirements.

### Observability readiness

- Audit evidence, correlation, authority responses, reconciliation queues, runbooks, and support controls are in the release boundary.

### Testing

- `./init.sh` validates the new role, command, skill, templates, example artifacts, feature spec, and regulatory-register structure.
- JSON and repository integrity checks pass.

### UX and accessibility

- Future user-facing specs must use country-aware Spanish, accessible workflows, and explicit uncertainty/approval states.

### Operations

- The first release includes backup/restore evidence, incident response, support ownership, reconciliation, rollback/remediation, and professional release gates.
