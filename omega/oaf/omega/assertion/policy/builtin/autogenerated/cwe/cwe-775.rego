package openssf.omega.policy.autogenerated.cwe.cwe_775

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_775
# title: "CWE-775: Missing Release of File Descriptor or Handle after Effective Lifetime"
# methodology: >
#   The product does not release a file descriptor or handle after its effective lifetime has ended, i.e., after the file descriptor/handle is no longer needed.
# version: 0.1.0
# last_updated:
#   date: 2023-05-25
#   author: Michael Scovetta <michael.scovetta@gmail.com>
# ---

import future.keywords.every
import future.keywords.in

default pass = false
default applies = false

# Identify whether this policy applies to a given data object
applies := true {
    input.predicate.generator.name == "openssf.omega.security_tool_finding"
    input.predicateType == "https://github.com/ossf/alpha-omega/security_tool_finding/0.1.0"
    input.predicate.content.tags
}

pass := true {
    every assertion in input {
        not "cwe-775" in assertion.predicate.content.tags
    }
}