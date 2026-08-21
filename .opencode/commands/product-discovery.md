# product-discovery

MODE:
SHIP product discovery. This command prepares the product control plane and never authorizes application implementation.

FEATURE:
The named product or the product-memory example explicitly selected by the human. For I-DO, use `examples/ido-erp/**` and `docs/product-memory/ido-erp-north-star.md`.

STATE:
Allowed start state: no application feature in `in_progress` or `review`, unless the active feature explicitly authorizes product-memory maintenance.
Allowed end state: discovery artifacts are reviewable and a bounded feature proposal can be handed to the Spec Author. No application feature status changes automatically.

SOURCE OF TRUTH:
- human product mandate
- `feature_list.json`
- `RTK.md`
- `docs/product-memory/**`
- `templates/product/**`
- authoritative regulatory sources recorded in the product register
- `progress/current.md`

FILES YOU MAY READ:
- `AGENTS.md`
- `RTK.md`
- `CLAUDE.md`
- `feature_list.json`
- `docs/**`
- `templates/**`
- `examples/<product>/**`
- `progress/**`
- `specs/**`

FILES YOU MAY TOUCH:
- `docs/product-memory/<product>-north-star.md`
- `examples/<product>/README.md`
- `examples/<product>/product/**`
- `progress/current.md`
- `progress/history.md`

FILES YOU MUST NOT TOUCH:
- application source files
- dependency manifests
- lockfiles
- database schemas or migrations
- environment files or secrets
- deployment configuration
- unrelated product memories or specs

DO:
- Audit the actual product surface and distinguish implemented behavior from positioning.
- Define target users, jobs, outcomes, metrics, non-goals, capabilities, production slices, and country-pack boundaries.
- Create a structured regulatory register using authoritative sources and verification dates.
- Label facts, inferences, hypotheses, and open decisions.
- Define financial safety invariants and human approval boundaries.
- Evaluate readiness for Graph Harness SDLC.
- Produce a bounded handoff for the Spec Author.
- Run `./init.sh` and product-specific validation.

DON'T:
- Implement application code.
- Infer legal compliance.
- Hard-code tax rates or filing behavior from memory.
- Mark a country pack production-ready without professional review.
- Move a feature to `approved`, `in_progress`, `review`, or `done` unless a separate approved feature authorizes that transition.
- Add dependencies, vendors, infrastructure, or paid resources.

OUTPUT:
- Product and mode
- Artifacts created or updated
- Verified facts and sources
- Hypotheses and open decisions
- Proposed first SHIP slice
- Graph-transition status
- Validation result
- Required human or professional gates

STOP:
Stop before application implementation. Hand the selected, bounded increment to the Spec Author or report the exact blocker.
