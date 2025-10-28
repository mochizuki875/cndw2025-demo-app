package signature

default allow = false

allow {
  input.predicateType == "https://slsa.dev/provenance/v0.2"

  # builder.idでgenerator_container_slsa3が指定されていること(正規表現で任意のタグを許可)
  regex.match("^https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3\\.yml@refs/tags/v[0-9]+\\.[0-9]+\\.[0-9]+$", input.predicate.builder.id)

  input.predicate.buildType == "https://github.com/slsa-framework/slsa-github-generator/container@v1"

  input.predicate.invocation.configSource.uri == "git+https://github.com/mochizuki875/cndw2025-demo-app@refs/heads/main"
  input.predicate.invocation.configSource.entryPoint == ".github/workflows/build.yaml"

  input.predicate.materials[0].uri == "git+https://github.com/mochizuki875/cndw2025-demo-app@refs/heads/main"
}