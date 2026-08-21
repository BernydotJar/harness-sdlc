# Product Discovery Skill

Use this skill to translate a broad product mandate into a reviewable SHIP product control plane before feature specification and implementation.

## Inputs

- Human product mandate
- Audited current product and repository state
- `feature_list.json`
- `docs/product-memory/**`
- `templates/product/**`
- Current authoritative regulatory sources

## Output

- Product brief
- Capability map
- Release strategy
- Structured regulatory register
- Open-decision log
- Graph-transition readiness assessment
- Bounded feature proposal for the Spec Author

## Checklist

- Current implementation is distinguished from marketing or design intent.
- Target customer and jobs are marked as evidence, inference, or hypothesis.
- The first release is a production slice, not an unbounded ERP rewrite.
- Financial invariants and segregation of duties are explicit.
- Country-specific behavior is isolated in versioned country packs.
- Each regulatory claim has an authority, URL, jurisdiction, last-verified date, product implication, and counsel status.
- Legal, tax, accounting, labor, privacy, and payment conclusions are not invented.
- AI side effects are bounded by human approval and audit evidence.
- Non-goals and deferred capabilities are explicit.
- Success metrics are measurable and do not reward unsafe automation.
- Graph-transition criteria are evaluated honestly.
- No application implementation has started.
