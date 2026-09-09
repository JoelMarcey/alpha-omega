# OpenJS Foundation Security Update: August 2026

*Covering August 2026 | Powered by the Alpha-Omega Partnership*

This month's work focused on an extensive review of the security reports submitted by the Trail of Bits team, expanding the Node.js permission model, hardening security documentation and triage practices, and maintaining backport pipelines. Below is a summary of completed items across security fixes, documentation, tooling, and community engagement.

## Node.js Permission Model & Security Fixes

### Trail of Bits Report Review

A large portion of August was dedicated to reviewing the security reports and
pull requests submitted by the Trail of Bits team as part of their security
assessment of Node.js. Each report was individually assessed against the
Node.js threat model and the documented Permission Model security boundaries,
and dispositioned as a vulnerability, a security-interest hardening
opportunity, or an out-of-scope finding.

This review drove most of the security work landed this month:

* Confirmed findings were fixed directly in Node.js core.
* Findings that exposed ambiguity in what Node.js considers a security
  boundary motivated a `SECURITY.md` overhaul
  ([PR #65436](https://github.com/nodejs/node/pull/65436)) that formally
  defines triage dispositions, documents same-process self-harm exclusions,
  and separates Permission Model reports into vulnerability,
  security-interest, and excluded categories. This gives future reporters —
  human or AI-assisted a clear, documented baseline for what is and is not
  in scope.

### Improvements to Node.js APIs Landed

The following fixes were landed as a result of the review, continuing the
enforcement and refinement of the Permission Model:

- **[Permission] Guard UDP** — Restricted UDP access under the permission model.
  - [PR #65358](https://github.com/nodejs/node/pull/65358) (Completed Aug 24)
- **permission: enforce addon permission in GetLinkedBinding** — Applied permission checks to linked bindings.
  - [PR #65432](https://github.com/nodejs/node/pull/65432) (Completed Aug 24)
- **permission: block FileHandle fsync and fdatasync** — Blocked fsync/fdatasync on FileHandles when permissions are restricted.
  - [PR #65431](https://github.com/nodejs/node/pull/65431) (Completed Aug 27)
- **buffer: prevent abort on indexOf with lone surrogate needle** — Fixed a potential abort when using indexOf with a lone surrogate.
  - [PR #65430](https://github.com/nodejs/node/pull/65430) (Completed Aug 25)
- **fs: do not descend into symlinks for `**` unless following symlinks** — Prevented glob (`**`) from traversing symlinks unless explicitly following them.
  - [PR #65435](https://github.com/nodejs/node/pull/65435) (Completed Aug 31)

## Security Documentation & Triage

Clarity around security processes and triage dispositions was improved:

- **doc: update security release prepare command** — Updated the documented security release preparation command.
  - [PR #64699](https://github.com/nodejs/node/pull/64699) (Completed Aug 18)
- **doc: clarify security triage dispositions and permission boundaries** — Clarified how security triage dispositions work and where permission boundaries lie.
  - [PR #65436](https://github.com/nodejs/node/pull/65436) (Completed Aug 26)
- **Write more fixes from recent H1 reports** — Addressed additional items identified in H1 security reports. (Completed Aug 19)

## Backports & Release Pipeline

Maintenance of release branches and security tooling continued:

- **[v24.x] Backport permission updates to v24** — Backported permission model updates to the v24.x line.
  - [PR #65354](https://github.com/nodejs/node/pull/65354) (Completed Aug 20)
- **git node security --cleanup fix** — Fixed the `git node security --cleanup` command. (Completed Aug 12)

## Governance & Contribution Guidelines

Following discussion in the Node.js Technical Steering Committee, the project's
AI use policy was formalized and landed this month:

- **doc: create ai-guidelines and include to CONTRIBUTING** — Created
  `doc/contributing/ai-guidelines.md` and linked it from `CONTRIBUTING.md`.
  - [PR #62105](https://github.com/nodejs/node/pull/62105) (Merged Aug 12)

The new guidelines align with the OpenJS Foundation AI Coding Assistants
Policy and establish the project's position on AI-assisted contributions:

* Decision making must always rest on human judgement; contributors take full
  responsibility for AI-assisted changes and must disclose AI use along with
  how they personally verified the generated output.
* Contributors must be able to explain the value and implementation of their
  changes during review — disclosure is not a disclaimer of responsibility.
  Unverified AI-generated PRs may be closed without additional review, and
  repeat offenders may be blocked.
* Pull requests must not be opened by automated tooling without prior project
  approval, and using AI to automate fixes for "good first issue" items is
  prohibited, keeping those issues available for new human contributors.
* Practical guidance covers how to name AI tools in disclosures (avoiding
  for-profit brand promotion in commit messages) and how to handle AI use in
  code contributions and communications.

This continues the broader effort — alongside the HackerOne report template
requirements and the LLM-assisted triage tooling in `node-core-utils` — to
adapt Node.js contribution and security workflows to the growth of
AI-generated submissions.

## Community Engagement

Outreach and collaboration efforts this month included:

- **ParaibaJS talk (upcoming)** — Confirmed a security-focused talk for the
  ParaibaJS community meetup on September 12, bringing Node.js security topics
  — including the Permission Model and the project's security workflows — to
  the Brazilian JavaScript community.
- **Node.js Collaborator Summit preparation** — Began preparing session topics
  for the upcoming Node.js Collaborator Summit, building on the security,
  release schedule, and ecosystem sessions led at the previous summit in
  London.
- **Sovereign Tech Fund research** — Prepared research documentation for the
  Sovereign Tech Fund, laying the groundwork for potential additional funding
  for Node.js security and maintenance work. (Completed Aug 26)
