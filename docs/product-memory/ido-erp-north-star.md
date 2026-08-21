# I-DO ERP Product North Star

Status: Strategic product memory
Last verified: 2026-08-20
Decision owner: Human product owner
Applies to: the future I-DO application repository, `harness-sdlc`, and later `Graph-harness-sdlc` execution
Implementation authority: None by itself

> This document preserves product direction and safety constraints. It does not authorize application code, infrastructure, schema changes, fiscal submissions, or a production launch. Every increment still requires an approved SHIP specification, file boundaries, verification, review, and the required human or professional gates.

## 1. Product thesis

I-DO is an AI-native business operating system for Spanish-speaking companies that need to run finance and adjacent operations in one governed workspace.

It is not a generic chatbot, a collection of dashboards, or a landing page that merely lists ERP modules.

The product promise is:

> Run, automate, and improve the business from one auditable operating system, with financial truth at the center and country compliance delivered through versioned local packs.

The commercial ambition is multi-country SaaS. The first country packs are Colombia and Guatemala. Neither country may be hard-coded into the canonical financial kernel.

## 2. Current verified reality

A public-surface audit on 2026-08-20 found that `https://ido-hago.web.app/` behaves as a static, single-page product concept. The public HTML positions I-DO as an AI-native operating system spanning finance, sales, HR, support, analytics, agents, and workflows.

The audit did not expose authenticated application routes, a client application bundle, an API contract, or an operational ERP workflow. This is evidence about the public deployment only; it does not prove that no private backend or unpublished source exists.

No I-DO source repository was found among the GitHub repositories accessible during the audit. The application repository, deployment ownership, and migration path are therefore explicit blockers for product-code implementation.

## 3. Target customer hypotheses

These are hypotheses to validate, not established facts:

- Spanish-speaking small and medium businesses with 5–250 employees.
- Service, distribution, light commerce, and professional-services organizations.
- Companies that have outgrown spreadsheets and disconnected accounting, billing, banking, payroll, CRM, and support tools.
- Multi-entity or regional businesses that need auditable operations across Colombia and Guatemala.
- Operators who want AI assistance but cannot accept opaque financial actions.

Initial discovery must test segment, company size, accounting maturity, existing system, willingness to switch, implementation capacity, and local professional support.

## 4. Product principles

### Financial truth before breadth

The ledger, subledgers, fiscal documents, reconciliation, controls, and evidence model come before a broad catalog of shallow modules.

### One canonical core, many country packs

Shared concepts live in a country-neutral domain. Local tax identifiers, fiscal documents, schemas, numbering, signatures, tax books, reports, calendars, and authority integrations live in effective-dated country packs.

### Production slices, not MVP shortcuts

Every release slice must be secure, operable, observable, supportable, reversible, accessible, and legally reviewable. A smaller release is acceptable; a demo-quality release is not.

### Human authority for consequential effects

AI may prepare, classify, match, explain, forecast, and recommend. Posting, issuing, voiding, paying, filing, changing payroll, closing periods, and changing access require explicit authority and auditable approval.

### Evidence over compliance claims

The product preserves sources, versions, validation responses, signatures, approvals, and professional sign-off. It must never claim that the platform or a customer is “compliant” merely because a checklist exists.

### Localized repair

Errors in a country adapter, rule pack, integration, or workflow are repaired locally. The canonical financial model is not globally redesigned when a bounded correction is sufficient.

## 5. Human authority model

```text
HUMAN BUSINESS OWNER / ACCOUNTABLE EXECUTIVE
│
├── Human finance owner / controller
├── Human accountant or tax professional
├── Human legal and privacy counsel
├── Human security and operations owner
│
└── I-DO AI COMPANION
    ├── prepares and explains
    ├── proposes and reconciles
    ├── routes approvals
    └── never silently creates a legal or financial effect
```

Segregation of duties must support at least preparation, review, approval, posting, payment, filing, administration, and audit roles.

## 6. Canonical architecture

### Shared SaaS foundation

- tenant and organization
- legal entity and establishment
- identity, role, permission, and segregation of duties
- subscription and entitlement
- audit event and evidence object
- workflow, approval, notification, and task
- integration credential reference without exposing secrets
- observability, support, backup, restore, retention, and incident operations

### Financial kernel

- chart of accounts and account mappings
- ledger and journal entry
- accounting period, close, reopen, and lock
- dimensions, cost centers, projects, and tags
- currency and exchange-rate provenance
- customer, supplier, receivable, payable, credit, and settlement
- bank account, cash movement, statement, and reconciliation
- tax category, withholding, fiscal document, and authority event
- attachment, source document, approval, and immutable evidence

### Country-pack contract

Every pack must version:

- taxpayer and establishment identifiers
- fiscal document types and lifecycle states
- tax categories, withholding semantics, exemptions, and rounding rules
- numbering, signatures, XML or equivalent schemas, authority endpoints, and credentials
- validation, rejection, retry, contingency, cancellation, credit/debit note, and acceptance semantics
- statutory books, exports, reports, retention, calendars, and effective dates
- source authority, last verification date, implementation evidence, and professional approval

### Integration boundaries

- Fiscal authorities and authorized certifiers are accessed through adapters.
- Banks and payment service providers are accessed through adapters.
- External calls are idempotent, observable, retryable, and reconcilable.
- Vendor-specific payloads never become the canonical financial domain.

## 7. Financial safety invariants

- Posted journal entries are immutable; corrections use reversal or adjustment entries.
- Debit and credit totals balance for every posted entry.
- Monetary values use fixed-precision decimal arithmetic with explicit rounding policy.
- Every mutation is tenant-, legal-entity-, ledger-, period-, currency-, and jurisdiction-scoped.
- Period close and reopen are permissioned, justified, and audited.
- Fiscal validation state is distinct from commercial acceptance, payment state, and accounting posting state.
- Fiscal issuance, accounting posting, payment execution, and filing are separate commands and permissions.
- External requests have idempotency keys and immutable request/response evidence.
- Failed or uncertain submissions enter reconciliation; they are not silently retried into duplicate effects.
- AI-generated classifications and entries retain model/version, input provenance, confidence, reviewer, and final disposition.

## 8. First production slice

The first release is not “all ERP modules.” It is a complete finance-centered operating slice:

1. Multi-tenant organizations, legal entities, users, roles, approvals, and audit evidence.
2. Financial kernel with chart of accounts, journals, periods, dimensions, and immutable posting.
3. Customers, suppliers, accounts receivable, accounts payable, settlements, and bank reconciliation.
4. Sales and purchase document capture with a canonical fiscal-document lifecycle.
5. One production-capable country adapter, with the second country pack built against the same contract and released after its own professional gate.
6. Trial balance, general ledger, income statement, balance sheet, aging, tax-book/export foundations, and reconciliation reports.
7. Security, privacy, observability, backup/restore, support, incident, and rollback readiness.
8. AI assistance limited to drafts, matching, anomaly explanation, and approval routing until stronger controls are proven.

The launch sequence between Colombia and Guatemala remains a human product decision. Discovery and architecture proceed for both in parallel; production certification is sequential to contain risk.

## 9. Deferred capabilities

These remain in the capability map but are not automatically included in the first slice:

- inventory and warehouse management
- procurement planning
- CRM and marketing automation
- payroll and full HR administration
- customer support suite
- advanced workflow builder
- advanced forecasting and autonomous agents
- marketplace and broad third-party integrations

A deferred module enters the roadmap only after its upstream financial, legal, data, and operational dependencies are explicit.

## 10. Product outcomes

Candidate product outcomes, to be validated with customers:

- faster and more reliable month-end close
- lower unresolved reconciliation volume
- fewer duplicate or uncertain fiscal submissions
- complete approval and evidence trails for consequential actions
- shorter time from transaction to reconciled financial statement
- measurable reduction in manual re-entry across billing, accounting, and banking
- safe AI recommendation acceptance with traceable human review

Vanity metrics such as number of agents, dashboards, prompts, or generated transactions are not product outcomes.

## 11. Delivery strategy

### Iteration 0 — Product control plane

Use the linear `harness-sdlc` workflow to establish product memory, regulatory evidence, decisions, capability boundaries, and the first SHIP specs.

### Iteration 1 — Linear SHIP increments

Specify and review a small number of foundational increments one at a time. Resolve source repository, tenancy, financial model, country-pack contract, and authority-adapter decisions before parallel execution.

### Iteration 2 — Graph Harness SDLC

Move to Graph Harness only when nodes, dependencies, gates, evidence contracts, and terminal semantics are stable. Graph execution coordinates approved product work; it does not replace the product brief, regulatory register, or human authority.

## 12. Non-negotiable launch gates

- Application source and deployment ownership are known.
- Tenant isolation and access controls are independently verified.
- Financial invariants have property and integration tests.
- Backup and restore are proven, not merely configured.
- Country rules are effective-dated and sourced.
- Fiscal adapters pass authority/provider test environments and failure scenarios.
- Local accounting/tax professionals approve country behavior.
- Privacy and cross-border data decisions are documented.
- Incident response, support ownership, reconciliation, rollback, and customer communication are operable.
- No AI path can create an unapproved financial, fiscal, payment, payroll, or access-control effect.
