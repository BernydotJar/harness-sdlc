# 008-product-owner-control-plane Design

## Approach

Extend the reusable harness with one new orchestration role and its supporting command, skill, templates, validation, and decision record. Instantiate the capability as portable I-DO product memory rather than application code.

The design has four layers:

1. **Reusable role layer** — Product Owner definition and routing.
2. **Reusable artifact layer** — product brief, capability, release, regulatory, decision, and graph-readiness templates.
3. **I-DO product layer** — finance-centered SaaS thesis, production slice, capability map, country packs, open decisions, and structured regulatory evidence.
4. **Lifecycle layer** — SHIP feature spec, progress evidence, validation, review state, and later handoff to the actual application repository.

## Files You May Read

- `AGENTS.md`
- `RTK.md`
- `CLAUDE.md`
- `README.md`
- `feature_list.json`
- `init.sh`
- `.claude/agents/**`
- `.opencode/commands/**`
- `skills/**`
- `adr/**`
- `docs/**`
- `templates/**`
- `examples/**`
- `progress/**`
- `specs/**`

## Files You May Touch

- `.claude/agents/product-owner.md`
- `.claude/agents/leader.md`
- `.opencode/commands/product-discovery.md`
- `skills/product-discovery/skill.md`
- `templates/product/**`
- `docs/product-memory/README.md`
- `docs/product-memory/ido-erp-north-star.md`
- `examples/ido-erp/**`
- `adr/0005-product-owner-before-graph-runtime.md`
- `specs/008-product-owner-control-plane/**`
- `feature_list.json`
- `progress/current.md`
- `progress/history.md`
- `progress/impl_008-product-owner-control-plane.md`
- `progress/review_008-product-owner-control-plane.md`
- `progress/production_review_008-product-owner-control-plane.md`
- `RTK.md`
- `CLAUDE.md`
- `README.md`
- `init.sh`

## Files You Must Not Touch

- any I-DO application source because its repository is not verified
- Firebase deployment configuration
- package manifests and lockfiles
- database schemas and migrations
- environment files and secrets
- unrelated product-memory contents
- existing feature specifications

## Data Contracts

### Regulatory register

`examples/ido-erp/product/regulatory-register.json` requires:

Top-level fields:

- `product`
- `as_of`
- `disclaimer`
- `status_values`
- `jurisdictions`

Jurisdiction fields:

- `code`
- `name`
- `launch_priority`
- non-empty `entries`

Entry fields:

- `id`
- `domain`
- `status`
- `summary`
- non-empty `product_implications`
- non-empty `authoritative_sources`
- `professional_gate`
- `owner`

Source fields:

- `authority`
- `title`
- HTTPS `url`
- ISO `last_verified`

Required initial country codes are `CO` and `GT`.

### Product authority

Product-memory artifacts have no implementation authority. Application work must be copied or translated into the target repository's feature registry and approved SHIP specs.

## Dependencies

No package or runtime dependency is added.

The feature relies on system `python3` for validation and current official public sources for the regulatory register.

## Documentation Checkpoints

Context7 is not required because no application framework or API is implemented.

Current official checkpoints used:

- DIAN and SIC for Colombia fiscal and privacy requirements
- Colombian Congress, SUIN-Juriscol, and MinCIT for accounting frameworks
- SAT and Guatemalan Congress for FEL, tax books, accounting books, and privacy-legislation status

Every regulatory source is retained in the structured register with a verification date.

## Risks

- **Risk: product documents are mistaken for legal advice.**
  Mitigation: explicit disclaimer, professional gates, source metadata, and prohibition on compliance claims.

- **Risk: framework repository becomes the product repository.**
  Mitigation: all I-DO assets live as portable product memory/example; application implementation is blocked until source provenance is resolved.

- **Risk: scope expands to every ERP module.**
  Mitigation: first production slice and deferred capability map are explicit.

- **Risk: Colombia semantics leak into the canonical core.**
  Mitigation: country-pack contract and separate adapter lifecycles.

- **Risk: Graph execution starts too early.**
  Mitigation: machine-readable product artifacts plus an explicit `NOT_READY` checklist and transition ADR.

- **Risk: a source changes after verification.**
  Mitigation: `as_of`, `last_verified`, effective-date design, monitoring status, and pre-release refresh gate.

## Verification Plan

Run:

```sh
./init.sh
python3 -m json.tool feature_list.json >/dev/null
python3 -m json.tool examples/ido-erp/product/regulatory-register.json >/dev/null
git diff --check
git status --short --branch
```

Expected results:

- harness validation passes;
- feature and regulatory JSON are valid;
- exactly one active feature exists (`008-product-owner-control-plane` in `review`);
- no whitespace errors, secrets, application code, dependencies, schemas, or deployment files are introduced.
