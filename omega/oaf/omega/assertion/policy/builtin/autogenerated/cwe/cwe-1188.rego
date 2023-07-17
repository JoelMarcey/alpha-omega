package openssf.omega.policy.autogenerated.cwe.cwe_1188

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_1188
# title: "CWE-1188: Insecure Default Initialization of Resource"
# methodology: >
#   The product initializes or sets a resource with a default that is intended to be changed by the administrator, but the default is not secure.
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
        not "cwe-1188" in assertion.predicate.content.tags
    }
}