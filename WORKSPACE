# Bazel workspace created by @bazel/create 2.0.1

# Declares that this directory is the root of a Bazel workspace.
# See https://docs.bazel.build/versions/master/build-ref.html#workspace
workspace(
    # How this workspace would be referenced with absolute labels from another workspace
    name = "decrypto",
    # Map the @npm bazel workspace to the node_modules directory.
    # This lets Bazel use the same node_modules as other local tooling.
    managed_directories = {"@npm": ["www/node_modules"]},
)

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "bazel_skylib",
    commit = "2a44ef8ec8c419abd49852b873209de3ab742af7",
    remote = "https://github.com/bazelbuild/bazel-skylib.git",
    shallow_since = "1595379092 +0800",
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

git_repository(
    name = "io_bazel_rules_rust",
    commit = "09ec54ca17c3b91dff256c520f1724fd9c329cab",
    remote = "https://github.com/bazelbuild/rules_rust.git",
    shallow_since = "1595437342 +0200",
)

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories(
    edition = "2018",
    version = "1.44.1",
)

load("@io_bazel_rules_rust//bindgen:repositories.bzl", "rust_bindgen_repositories")

rust_bindgen_repositories()

load("@io_bazel_rules_rust//wasm_bindgen:repositories.bzl", "rust_wasm_bindgen_repositories")

rust_wasm_bindgen_repositories()

# Install the nodejs "bootstrap" package
# This provides the basic tools for running and packaging nodejs programs in Bazel
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "0f2de53628e848c1691e5729b515022f5a77369c76a09fbe55611e12731c90e3",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/2.0.1/rules_nodejs-2.0.1.tar.gz"],
)

# The npm_install rule runs yarn anytime the package.json or package-lock.json file changes.
# It also extracts any Bazel rules distributed in an npm package.
load("@build_bazel_rules_nodejs//:index.bzl", "node_repositories", "npm_install")

node_repositories(package_json = ["//www:package.json"])

npm_install(
    # Name this npm so that Bazel Label references look like @npm//package
    name = "npm",
    package_json = "//www:package.json",
    package_lock_json = "//www:package-lock.json",
)

load("//rust/cargo:crates.bzl", rust_raze = "raze_fetch_remote_crates")

rust_raze()
