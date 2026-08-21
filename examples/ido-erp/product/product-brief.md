# I-DO ERP Product Brief

Status: Review
Mode: SHIP
Decision owner: Human product owner
Last verified: 2026-08-20
Implementation authority: None by itself

## Product thesis

I-DO is a finance-centered, AI-native business operating system for Spanish-speaking companies. It unifies governed workflows and evidence around a trustworthy financial core, then expands into adjacent ERP capabilities through stable contracts.

## Current reality

### Verified

- The public deployment presents a single-page concept for finance, sales, HR, support, analytics, AI agents, and workflows.
- The audited public page did not expose authenticated product routes, a visible application bundle, or an API contract.
- No matching I-DO repository was found among the GitHub repositories accessible in the session.

### Inference

- The current deployment is best treated as positioning and interaction design, not evidence of an operational ERP.
- The next safe action is to create the product control plane and locate or establish the application repository before implementation.

### Unknown

- Source repository and branch
- Firebase project ownership and deployment pipeline
- Existing backend, data model, identity provider, and customer data
- Current users or design partners
- Commercial entity, pricing, support model, and launch sequence

## Target customer hypotheses

1. Small and medium businesses with fragmented finance and operations.
2. Service and distribution companies that require local fiscal documents and auditable approvals.
3. Multi-entity operators beginning in Colombia and Guatemala.
4. Teams that value AI assistance but require human control over consequential effects.

Discovery must invalidate or refine these hypotheses before pricing or broad module development.

## Jobs to be done

- Know the current financial position without reconciling multiple spreadsheets and systems.
- Issue, receive, validate, post, reconcile, and retain fiscal documents with evidence.
- Control who can prepare, approve, post, pay, file, and administer.
- Close an accounting period with explainable exceptions and reproducible reports.
- Expand to another country without replacing the financial core.
- Use AI to reduce manual work without surrendering accountability.

## Outcomes and measures

- Median time to complete month-end close
- Percentage of bank lines automatically matched and human-confirmed
- Unresolved fiscal submissions by age and cause
- Duplicate-effect rate across posting, issuing, and payment commands
- Percentage of consequential actions with complete approval and evidence chain
- Time to recover and reconcile after authority/provider failure
- Customer-reported manual re-entry hours removed
- AI proposal acceptance, correction, and rejection rates with reviewer traceability

## Product principles

- Financial correctness before module breadth
- Canonical core plus versioned country packs
- Human approval for consequential actions
- Immutable evidence and localized repair
- No unsupported compliance claims
- Spanish-first UX with English-ready product architecture
- Operational readiness is part of the feature, not post-launch work

## First production slice

- Tenant, organization, legal entity, establishment, user, role, approval, and audit evidence
- Chart of accounts, ledger, journal, period control, dimensions, and balanced posting
- Customer, supplier, receivable, payable, settlement, cash, bank statement, and reconciliation
- Canonical sales/purchase/fiscal document lifecycle
- Production country adapter selected through an explicit launch decision
- Trial balance, ledger, financial statements, aging, and tax-book/export foundations
- Security, privacy, observability, backup/restore, support, and incident operations
- AI drafts, matching proposals, anomaly explanations, and approval routing only

## Non-goals for the first production slice

- Full inventory and manufacturing
- Full payroll and HR suite
- Generic no-code workflow marketplace
- Autonomous payment, posting, filing, fiscal issuance, or payroll execution
- Every integration and every Latin American country
- Replacing local accountants, tax advisers, or legal counsel

## Human authority and AI boundaries

AI outputs are proposals until a specifically authorized human accepts them. The system must preserve the input evidence, model/version, proposed action, confidence or rationale, reviewer, approval, final command, external response, and reconciliation result.

## Required decisions

See `open-decisions.md`. The application source repository is the first gating decision.

## Spec Author handoff

After the repository decision, the first proposed application feature is:

> Establish the multi-tenant SaaS and financial-control foundation, including legal entities, roles, segregation of duties, audit evidence, command idempotency, and an empty but enforceable ledger boundary.

This proposal must be converted into a target-repository SHIP spec before code begins.
