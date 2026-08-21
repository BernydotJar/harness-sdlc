# 008-product-owner-control-plane Tasks

## Implementation Tasks

- [x] Audit the live I-DO public surface and accessible repositories.
- [x] Persist a dated, bounded public-surface audit artifact.
- [x] Recover a clean `harness-sdlc` workspace instead of using the mislabeled Graph workspace.
- [x] Create the Product Owner role.
- [x] Create the product-discovery command contract.
- [x] Create the product-discovery skill.
- [x] Create reusable product templates.
- [x] Create I-DO Product North Star.
- [x] Create I-DO product brief.
- [x] Create I-DO capability map.
- [x] Create I-DO release strategy.
- [x] Create I-DO open-decision log.
- [x] Create I-DO graph-transition assessment.
- [x] Research and record initial official Colombia requirements.
- [x] Research and record initial official Guatemala requirements.
- [x] Create structured regulatory register.
- [x] Create ADR for linear Product Owner discovery before graph execution.
- [x] Route the new role through harness instructions and documentation.
- [x] Extend harness validation.
- [x] Record implementation evidence and move the feature to `review`.

## Verification Tasks

- [x] Run `./init.sh`.
- [x] Validate `feature_list.json`.
- [x] Validate `regulatory-register.json`.
- [x] Verify command headings and file boundaries.
- [x] Verify required country codes and source metadata.
- [x] Run `git diff --check`.
- [x] Inspect final diff for secrets, app code, dependencies, schemas, deployment changes, and unsupported compliance claims.

## Review Tasks

- [x] Reviewer validates requirements, design, tasks, diff, and evidence.
- [x] Production Reviewer evaluates SHIP governance gates.
- [ ] Human reviews product boundary, first production slice, open decisions, and graph transition gate.
- [ ] Qualified professionals review country requirements before any application release.

## Stop Conditions

- Stop before I-DO application implementation until the source repository is identified.
- Stop before deployment, migration, paid service, vendor contract, fiscal submission, or production data access.
- Stop before claiming legal, tax, accounting, privacy, or fiscal compliance.
- Keep Graph transition `NOT_READY` until its checklist is satisfied.
