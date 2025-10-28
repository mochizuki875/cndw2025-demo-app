# Cosign In-Toto Attestations 
[Cosign In-Toto Attestations](https://docs.sigstore.dev/cosign/verifying/attestation/)

## List the tags in a repository and get the digest of a specific tag
List the tags
```bash
crane ls ghcr.io/mochizuki875/cndw2025-demo-app
```
```bash
main
sha256-c8cde6b8340e4c85656e94927f594433838268b7425b0a1fbb8582d05308606e.att
```

Get the digest
```bash
crane digest ghcr.io/mochizuki875/cndw2025-demo-app:main
```
```bash
sha256:c8cde6b8340e4c85656e94927f594433838268b7425b0a1fbb8582d05308606e
```

## Downloading and Decoding Attestations
```bash
cosign download attestation ghcr.io/mochizuki875/cndw2025-demo-app:main | jq '.payload |= (@base64d | fromjson)'
```

## Verifying Attestations with a Policy
```bash
cosign verify-attestation \
  --type slsaprovenance \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp '^https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/tags/v[0-9]+.[0-9]+.[0-9]+$' \
  --policy=provenance-policy.rego \
  ghcr.io/mochizuki875/cndw2025-demo-app:main
```
```bash
will be validating against Rego policies: [provenance-policy.rego]

Verification for ghcr.io/mochizuki875/cndw2025-demo-app:main --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - The code-signing certificate was verified using trusted certificate authority certificates
Certificate subject: https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/tags/v2.1.0
Certificate issuer URL: https://token.actions.githubusercontent.com
GitHub Workflow Trigger: push
GitHub Workflow SHA: c8026081a6aa9196256848bd05e4d62120031be3
GitHub Workflow Name: Container Image Build with SLSA Provenance
GitHub Workflow Repository: mochizuki875/cndw2025-demo-app
GitHub Workflow Ref: refs/heads/main
```