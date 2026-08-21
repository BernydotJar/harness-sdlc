#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
import datetime
import json
import pathlib
import sys
from urllib.parse import urlparse

root = pathlib.Path(".")

required_files = [
    "AGENTS.md",
    "RTK.md",
    "CLAUDE.md",
    "README.md",
    "feature_list.json",
    "init.sh",
    "docs/methodology.md",
    "docs/modes.md",
    "docs/production-readiness.md",
    "docs/quality-gates.md",
    "docs/security-model.md",
    "docs/database-change-policy.md",
    "docs/token-economy.md",
    "docs/loop-engineering.md",
    "docs/release-readiness.md",
    "docs/human-in-the-loop.md",
    "docs/roadmap-design.md",
    "docs/anti-patterns.md",
    "docs/decision-records.md",
    "docs/mcp-context7-policy.md",
    "docs/specs.md",
    "docs/verification.md",
    "docs/conventions.md",
    "docs/product-memory/ido-erp-north-star.md",
    "templates/feature/requirements.md",
    "templates/feature/design.md",
    "templates/feature/tasks.md",
    "templates/product/product-brief.md",
    "templates/product/capability-map.md",
    "templates/product/release-strategy.md",
    "templates/product/regulatory-register.json",
    "templates/product/decision-log.md",
    "templates/product/graph-transition-readiness.md",
    "templates/prompts/goal.md",
    "templates/prompts/mvp-mode.md",
    "templates/prompts/ship-mode.md",
    "templates/prompts/production-spec-patch.md",
    "templates/prompts/spec-next.md",
    "templates/prompts/approve-feature.md",
    "templates/prompts/implement-mvp.md",
    "templates/prompts/implement-ship.md",
    "templates/prompts/review-mvp.md",
    "templates/prompts/review-ship.md",
    "templates/prompts/close-feature.md",
    "templates/prompts/blocker.md",
    "templates/prompts/resume-session.md",
    "templates/review/mvp-review.md",
    "templates/review/ship-review.md",
    "templates/review/production-review.md",
    "templates/review/security-review.md",
    "templates/review/db-review.md",
    "adr/0001-use-sdd-lifecycle.md",
    "adr/0002-use-mvp-and-ship-modes.md",
    "adr/0003-require-human-approval-before-implementation.md",
    "adr/0004-require-production-reviewer-for-ship-mode.md",
    "adr/0005-product-owner-before-graph-runtime.md",
    "examples/feature_list.example.json",
    "examples/specs-example/001-auth/requirements.md",
    "examples/specs-example/001-auth/design.md",
    "examples/specs-example/001-auth/tasks.md",
    "examples/specs-example/002-search/requirements.md",
    "examples/specs-example/002-search/design.md",
    "examples/specs-example/002-search/tasks.md",
    "examples/progress-example/current.md",
    "examples/progress-example/history.md",
    "examples/ido-erp/README.md",
    "examples/ido-erp/product/public-surface-audit.md",
    "examples/ido-erp/product/product-brief.md",
    "examples/ido-erp/product/capability-map.md",
    "examples/ido-erp/product/release-strategy.md",
    "examples/ido-erp/product/regulatory-register.json",
    "examples/ido-erp/product/open-decisions.md",
    "examples/ido-erp/product/graph-transition-readiness.md",
    "progress/current.md",
    "progress/history.md",
    "progress/impl_008-product-owner-control-plane.md",
    "progress/review_008-product-owner-control-plane.md",
    "progress/production_review_008-product-owner-control-plane.md",
    "specs/008-product-owner-control-plane/requirements.md",
    "specs/008-product-owner-control-plane/design.md",
    "specs/008-product-owner-control-plane/tasks.md",
]

command_files = [
    ".opencode/commands/product-discovery.md",
    ".opencode/commands/spec-next.md",
    ".opencode/commands/approve-feature.md",
    ".opencode/commands/production-spec-patch.md",
    ".opencode/commands/implement-feature.md",
    ".opencode/commands/review-feature.md",
    ".opencode/commands/close-feature.md",
    ".opencode/commands/status.md",
    ".opencode/commands/verify.md",
    ".opencode/commands/use-context7.md",
]

agent_files = [
    ".claude/agents/leader.md",
    ".claude/agents/product-owner.md",
    ".claude/agents/spec-author.md",
    ".claude/agents/implementer.md",
    ".claude/agents/reviewer.md",
    ".claude/agents/production-reviewer.md",
]

skill_files = [
    "skills/product-discovery/skill.md",
    "skills/spec-authoring/skill.md",
    "skills/production-readiness-review/skill.md",
    "skills/security-review/skill.md",
    "skills/db-migration-review/skill.md",
    "skills/i18n-accessibility-review/skill.md",
    "skills/prompt-contract-review/skill.md",
    "skills/test-strategy/skill.md",
]

required_headings = [
    "MODE:",
    "FEATURE:",
    "STATE:",
    "SOURCE OF TRUTH:",
    "DO:",
    "DON'T:",
    "OUTPUT:",
    "STOP:",
]

errors = []

for file_name in required_files + command_files + agent_files + skill_files:
    if not (root / file_name).is_file():
        errors.append(f"missing required file: {file_name}")

try:
    data = json.loads((root / "feature_list.json").read_text())
except Exception as exc:
    errors.append(f"feature_list.json is not valid JSON: {exc}")
    data = {}

allowed = set(data.get("allowed_statuses", []))
expected = {"pending", "spec_ready", "approved", "in_progress", "review", "done", "blocked"}
if allowed != expected:
    errors.append(f"allowed_statuses must be exactly {sorted(expected)}")

features = data.get("features", [])
if not isinstance(features, list) or not features:
    errors.append("feature_list.json must contain a non-empty features array")

active_statuses = {"approved", "in_progress", "review"}
active = [f.get("id") for f in features if f.get("status") in active_statuses]
if len(active) > 1:
    errors.append(f"at most one active feature is allowed, found: {active}")

spec_required_statuses = {"spec_ready", "approved", "in_progress", "review", "done"}
for feature in features:
    feature_id = feature.get("id")
    status = feature.get("status")
    if status not in expected:
        errors.append(f"{feature_id}: invalid status {status!r}")
    if status in spec_required_statuses:
        for spec_file in ["requirements.md", "design.md", "tasks.md"]:
            path = root / "specs" / str(feature_id) / spec_file
            if not path.is_file():
                errors.append(f"{feature_id}: missing spec file {path}")

for command_file in command_files:
    path = root / command_file
    if not path.is_file():
        continue
    text = path.read_text()
    for heading in required_headings:
        if heading not in text:
            errors.append(f"{command_file}: missing heading {heading}")
    for boundary in ["FILES YOU MAY READ", "FILES YOU MAY TOUCH", "FILES YOU MUST NOT TOUCH"]:
        if boundary not in text:
            errors.append(f"{command_file}: missing boundary {boundary}")

context_policy = root / "docs/mcp-context7-policy.md"
if context_policy.is_file():
    text = context_policy.read_text().lower()
    for term in ["context7", "next.js", "react", "prisma", "postgresql", "tailwind", "vitest"]:
        if term not in text:
            errors.append(f"docs/mcp-context7-policy.md: missing policy term {term}")

for skill_file in skill_files:
    path = root / skill_file
    if not path.is_file():
        continue
    text = path.read_text().lower()
    if "checklist" not in text:
        errors.append(f"{skill_file}: missing checklist")

quality_gates = root / "docs/quality-gates.md"
if quality_gates.is_file():
    text = quality_gates.read_text().lower()
    for gate in ["spec gate", "approval gate", "implementation gate", "review gate", "production gate", "close gate"]:
        if gate not in text:
            errors.append(f"docs/quality-gates.md: missing {gate}")

for example_json in ["examples/feature_list.example.json"]:
    try:
        json.loads((root / example_json).read_text())
    except Exception as exc:
        errors.append(f"{example_json} is not valid JSON: {exc}")

register_path = root / "examples/ido-erp/product/regulatory-register.json"
try:
    register = json.loads(register_path.read_text())
except Exception as exc:
    errors.append(f"{register_path} is not valid JSON: {exc}")
    register = {}

try:
    register_as_of = datetime.date.fromisoformat(register.get("as_of", ""))
except Exception:
    errors.append(f"{register_path}: as_of must be an ISO date")
    register_as_of = None

register_statuses = set(register.get("status_values", []))
expected_register_statuses = {
    "verified_product_requirement",
    "professional_review_required",
    "monitoring",
    "deferred",
}
if register_statuses != expected_register_statuses:
    errors.append(
        f"{register_path}: status_values must be exactly {sorted(expected_register_statuses)}"
    )

jurisdictions = register.get("jurisdictions", [])
if not isinstance(jurisdictions, list):
    errors.append(f"{register_path}: jurisdictions must be an array")
    jurisdictions = []

codes = {jurisdiction.get("code") for jurisdiction in jurisdictions if isinstance(jurisdiction, dict)}
if codes != {"CO", "GT"}:
    errors.append(f"{register_path}: jurisdictions must contain exactly CO and GT")

official_source_hosts = {
    "www.dian.gov.co",
    "micrositios.dian.gov.co",
    "normograma.dian.gov.co",
    "sedeelectronica.sic.gov.co",
    "www.secretariasenado.gov.co",
    "www.suin-juriscol.gov.co",
    "www.mincit.gov.co",
    "portal.sat.gob.gt",
    "www.congreso.gob.gt",
}

seen_entry_ids = set()
for jurisdiction in jurisdictions:
    if not isinstance(jurisdiction, dict):
        errors.append(f"{register_path}: each jurisdiction must be an object")
        continue
    for field in ["code", "name", "launch_priority", "entries"]:
        if not jurisdiction.get(field):
            errors.append(f"{register_path}: jurisdiction missing {field}")
    entries = jurisdiction.get("entries", [])
    if not isinstance(entries, list) or not entries:
        errors.append(f"{register_path}: {jurisdiction.get('code')} must have entries")
        continue
    for entry in entries:
        if not isinstance(entry, dict):
            errors.append(f"{register_path}: each entry must be an object")
            continue
        for field in [
            "id",
            "domain",
            "status",
            "summary",
            "product_implications",
            "authoritative_sources",
            "professional_gate",
            "owner",
        ]:
            if not entry.get(field):
                errors.append(f"{register_path}: entry missing {field}")
        entry_id = entry.get("id")
        if entry_id in seen_entry_ids:
            errors.append(f"{register_path}: duplicate entry id {entry_id}")
        seen_entry_ids.add(entry_id)
        jurisdiction_code = jurisdiction.get("code")
        if entry_id and jurisdiction_code and not str(entry_id).startswith(f"{jurisdiction_code}-"):
            errors.append(
                f"{register_path}: {entry_id} must start with jurisdiction code {jurisdiction_code}-"
            )
        if entry.get("status") not in expected_register_statuses:
            errors.append(f"{register_path}: {entry_id} has invalid status")
        implications = entry.get("product_implications", [])
        if not isinstance(implications, list) or not implications:
            errors.append(f"{register_path}: {entry_id} needs product implications")
        sources = entry.get("authoritative_sources", [])
        if not isinstance(sources, list) or not sources:
            errors.append(f"{register_path}: {entry_id} needs authoritative sources")
            continue
        for source in sources:
            for field in ["authority", "title", "url", "last_verified"]:
                if not source.get(field):
                    errors.append(f"{register_path}: {entry_id} source missing {field}")
            source_url = str(source.get("url", ""))
            if not source_url.startswith("https://"):
                errors.append(f"{register_path}: {entry_id} source URL must use HTTPS")
            source_host = urlparse(source_url).hostname
            if source_host not in official_source_hosts:
                errors.append(
                    f"{register_path}: {entry_id} source host {source_host!r} is not an approved official authority"
                )
            try:
                source_date = datetime.date.fromisoformat(source.get("last_verified", ""))
                if register_as_of and source_date > register_as_of:
                    errors.append(
                        f"{register_path}: {entry_id} source date cannot be after register as_of"
                    )
            except Exception:
                errors.append(f"{register_path}: {entry_id} source date must be ISO")

graph_readiness = root / "examples/ido-erp/product/graph-transition-readiness.md"
if graph_readiness.is_file() and "NOT_READY" not in graph_readiness.read_text():
    errors.append(f"{graph_readiness}: initial Graph status must be NOT_READY")

if errors:
    print("Harness validation failed:")
    for error in errors:
        print(f"- {error}")
    sys.exit(1)

print("Harness validation passed.")
print(f"Features: {len(features)}")
print(f"Active features: {len(active)}")
PY
