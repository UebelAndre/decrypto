"""
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def _new_http_archive(name, **kwargs):
    if not native.existing_rule(name):
        http_archive(name=name, **kwargs)

def _new_git_repository(name, **kwargs):
    if not native.existing_rule(name):
        new_git_repository(name=name, **kwargs)

def raze_fetch_remote_crates():

    _new_http_archive(
        name = "raze__bumpalo__2_6_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bumpalo/bumpalo-2.6.0.crate",
        type = "tar.gz",
        sha256 = "ad807f2fc2bf185eeb98ff3a901bd46dc5ad58163d0fa4577ba0d25674d71708",
        strip_prefix = "bumpalo-2.6.0",
        build_file = Label("//rust/cargo/remote:bumpalo-2.6.0.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__cfg_if__0_1_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.10.crate",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//rust/cargo/remote:cfg-if-0.1.10.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__console_error_panic_hook__0_1_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/console_error_panic_hook/console_error_panic_hook-0.1.6.crate",
        type = "tar.gz",
        sha256 = "b8d976903543e0c48546a91908f21588a680a8c8f984df9a5d69feccb2b2a211",
        strip_prefix = "console_error_panic_hook-0.1.6",
        build_file = Label("//rust/cargo/remote:console_error_panic_hook-0.1.6.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__lazy_static__1_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lazy_static/lazy_static-1.4.0.crate",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//rust/cargo/remote:lazy_static-1.4.0.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__log__0_4_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/log/log-0.4.11.crate",
        type = "tar.gz",
        sha256 = "4fabed175da42fed1fa0746b0ea71f412aa9d35e76e95e59b192c64b9dc2bf8b",
        strip_prefix = "log-0.4.11",
        build_file = Label("//rust/cargo/remote:log-0.4.11.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__proc_macro2__0_4_30",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-0.4.30.crate",
        type = "tar.gz",
        sha256 = "cf3d2011ab5c909338f7887f4fc896d35932e29146c12c8d01da6b22a80ba759",
        strip_prefix = "proc-macro2-0.4.30",
        build_file = Label("//rust/cargo/remote:proc-macro2-0.4.30.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__quote__0_6_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-0.6.13.crate",
        type = "tar.gz",
        sha256 = "6ce23b6b870e8f94f81fb0a363d65d86675884b34a09043c81e5562f11c1f8e1",
        strip_prefix = "quote-0.6.13",
        build_file = Label("//rust/cargo/remote:quote-0.6.13.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__syn__0_15_44",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-0.15.44.crate",
        type = "tar.gz",
        sha256 = "9ca4b3b69a77cbe1ffc9e198781b7acb0c7365a883670e8f1c1bc66fba79a5c5",
        strip_prefix = "syn-0.15.44",
        build_file = Label("//rust/cargo/remote:syn-0.15.44.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.1.0.crate",
        type = "tar.gz",
        sha256 = "fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = Label("//rust/cargo/remote:unicode-xid-0.1.0.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen/wasm-bindgen-0.2.48.crate",
        type = "tar.gz",
        sha256 = "4de97fa1806bb1a99904216f6ac5e0c050dc4f8c676dc98775047c38e5c01b55",
        strip_prefix = "wasm-bindgen-0.2.48",
        build_file = Label("//rust/cargo/remote:wasm-bindgen-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_backend__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-backend/wasm-bindgen-backend-0.2.48.crate",
        type = "tar.gz",
        sha256 = "5d82c170ef9f5b2c63ad4460dfcee93f3ec04a9a36a4cc20bc973c39e59ab8e3",
        strip_prefix = "wasm-bindgen-backend-0.2.48",
        build_file = Label("//rust/cargo/remote:wasm-bindgen-backend-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_macro__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro/wasm-bindgen-macro-0.2.48.crate",
        type = "tar.gz",
        sha256 = "f07d50f74bf7a738304f6b8157f4a581e1512cd9e9cdb5baad8c31bbe8ffd81d",
        strip_prefix = "wasm-bindgen-macro-0.2.48",
        build_file = Label("//rust/cargo/remote:wasm-bindgen-macro-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_macro_support__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro-support/wasm-bindgen-macro-support-0.2.48.crate",
        type = "tar.gz",
        sha256 = "95cf8fe77e45ba5f91bc8f3da0c3aa5d464b3d8ed85d84f4d4c7cc106436b1d7",
        strip_prefix = "wasm-bindgen-macro-support-0.2.48",
        build_file = Label("//rust/cargo/remote:wasm-bindgen-macro-support-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_shared__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-shared/wasm-bindgen-shared-0.2.48.crate",
        type = "tar.gz",
        sha256 = "d9c2d4d4756b2e46d3a5422e06277d02e4d3e1d62d138b76a4c681e925743623",
        strip_prefix = "wasm-bindgen-shared-0.2.48",
        build_file = Label("//rust/cargo/remote:wasm-bindgen-shared-0.2.48.BUILD.bazel"),
    )

