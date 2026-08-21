# I-DO ERP Capability Map

Status: Review
Mode: SHIP
Last verified: 2026-08-20

## Status vocabulary

- **Foundation** — required before any production financial workflow.
- **First production slice** — user-visible capability required for the first country launch.
- **Country release** — required only when the named country is enabled.
- **Next** — follows after the first slice proves its controls.
- **Later** — strategically relevant but deliberately deferred.
- **Excluded** — outside the product boundary.

## Shared SaaS platform

| Capability | Status | Key product contract | Primary dependency |
|---|---|---|---|
| Tenant and organization | Foundation | Hard tenant boundary; no cross-tenant reads or writes | Source repository and architecture decision |
| Legal entities and establishments | Foundation | Country, identifiers, base currency, reporting framework, fiscal registrations | Country-pack contract |
| Identity and sessions | Foundation | MFA-ready, revocation, device/session audit | Identity-provider decision |
| Roles and segregation of duties | Foundation | Separate prepare, review, approve, post, pay, file, administer, audit | Human authority model |
| Audit and evidence ledger | Foundation | Append-only event references, actor, reason, before/after, source, correlation | Canonical event schema |
| Workflow and approvals | Foundation | Effective-dated policies and explicit approval states | Role model |
| Subscription and entitlements | First production slice | Plan limits never weaken financial or security controls | Pricing decision |
| Notifications and tasks | First production slice | Idempotent, preference-aware, failure-visible | Workflow engine |
| File and evidence storage | Foundation | Malware checks, retention, encryption, immutable fiscal evidence | Storage and region decision |
| Observability and support | Foundation | Tenant-aware logs, metrics, traces, runbooks, support access controls | Runtime decision |
| Backup, restore, and disaster recovery | Foundation | Tested restore with RPO/RTO evidence | Data architecture |

## Financial kernel

| Capability | Status | Key product contract | Primary dependency |
|---|---|---|---|
| Chart of accounts | Foundation | Versioned per legal entity; mapping supports country reports | Accounting-model review |
| General ledger | Foundation | Balanced double-entry; immutable posted entries | Decimal and posting contracts |
| Journals and posting engine | Foundation | Draft, reviewed, approved, posted, reversed lifecycle | Roles and period controls |
| Accounting periods | Foundation | Open, soft-close, closed, reopened with reason and authority | Ledger |
| Dimensions and cost centers | First production slice | Stable references and reporting integrity | Ledger |
| Currencies and exchange rates | First production slice | Fixed precision, source provenance, effective timestamps | Data-provider decision |
| Accounts receivable | First production slice | Invoice/credit/debit, aging, settlement, write-off approval | Customer and fiscal documents |
| Accounts payable | First production slice | Bill/credit, approval, due dates, settlement, withholding context | Supplier and country pack |
| Cash and bank | First production slice | Accounts, statements, transactions, reconciliation, uncertainty states | Bank import/integration |
| Fixed assets | Next | Capitalization, depreciation policy, disposal, evidence | Accounting review |
| Budgets and forecasts | Next | Scenario/version separation from actual ledger | Financial reports |
| Consolidation | Later | Multi-entity eliminations and translation | Proven multi-entity ledger |

## Fiscal-document platform

| Capability | Status | Key product contract | Primary dependency |
|---|---|---|---|
| Canonical fiscal document | Foundation | Country-neutral parties, lines, totals, references, lifecycle, evidence | Financial kernel |
| Fiscal command orchestration | Foundation | Idempotent issue, validate, cancel, note, retry, reconcile commands | Audit and observability |
| Authority/provider adapter contract | Foundation | Normalized requests/results; vendor payload isolated | Country packs |
| Human exception queue | First production slice | Unknown, rejected, duplicate-risk, and contingency cases | Fiscal orchestration |
| Colombia DIAN adapter | Country release: Colombia | Prior validation, CUFE/CUDE evidence, notes, contingency, separate RADIAN events | Current DIAN technical review |
| Guatemala FEL adapter | Country release: Guatemala | DTE XML, signature, certifier/SAT lifecycle, authorization, rejection/reversal, cancellation | Certifier and SAT review |

## Reporting and controls

| Capability | Status | Key product contract | Primary dependency |
|---|---|---|---|
| Trial balance and general ledger | First production slice | Reproducible as-of query from posted entries | Ledger |
| Income statement and balance sheet | First production slice | Framework/account mapping and comparative periods | Chart of accounts |
| AR/AP aging | First production slice | Reconciles to subledger and ledger | AR/AP |
| Bank reconciliation report | First production slice | Explains matched, proposed, and unresolved lines | Bank reconciliation |
| Tax books and exports | Country release | Effective-dated layouts and source rules | Country pack |
| Close checklist and evidence | First production slice | Owner, status, exception, approval, immutable evidence | Workflow and reporting |
| Audit export | First production slice | Complete actor/action/evidence chain without exposing secrets | Audit ledger |

## Adjacent ERP domains

| Capability | Status | Reason for placement |
|---|---|---|
| Sales pipeline and CRM | Next | Valuable, but must use stable customer, quote, order, invoice, and revenue contracts |
| Procurement | Next | Follows supplier, approval, payable, and receiving contracts |
| Inventory and warehouse | Later | Requires valuation, movement, cost, tax, and physical-control design |
| Payroll and HR | Later / country-gated | High legal and privacy risk; requires separate country research and professional review |
| Customer support | Next | Can integrate after tenant, identity, customer, tasks, and evidence are stable |
| Projects and time | Next | Useful for services segment; depends on dimensions, billing, and cost allocation |
| Manufacturing | Later | Outside the first customer and financial-control hypothesis |

## AI and automation

| Capability | Status | Allowed effect |
|---|---|---|
| Natural-language explanation | First production slice | Read-only explanation with cited source records |
| Document extraction | First production slice | Draft fields with confidence and source references |
| Transaction classification | First production slice | Proposal only; human acceptance before posting |
| Reconciliation matching | First production slice | Proposed matches; explicit confirmation or policy-bounded auto-match with audit |
| Anomaly detection | First production slice | Alert and explanation only |
| Workflow drafting | Next | Draft policy/workflow; human publishes |
| Forecasting | Next | Scenario output separate from actual ledger |
| Autonomous posting, payment, filing, payroll, access changes | Excluded by default | Requires a future, separately approved safety case; never silent |

## Dependency order

```text
Source repository and ownership
  -> SaaS tenancy and authority model
  -> audit/evidence and command contracts
  -> financial kernel
  -> canonical fiscal document and adapter contract
  -> first country adapter
  -> AR/AP/bank and reports
  -> production operations and professional release gate
  -> second country adapter
  -> adjacent ERP modules
```

## Scope-control rule

A capability may move earlier only when its upstream domain, regulatory, security, data, test, support, and rollback contracts are already proven. A visually compelling module is not a reason to bypass the dependency order.
