"""
@generated
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
        strip_prefix = "bumpalo-2.6.0",
        build_file = Label("//rust/wasm/cargo/remote:bumpalo-2.6.0.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__cfg_if__0_1_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.10.crate",
        type = "tar.gz",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//rust/wasm/cargo/remote:cfg-if-0.1.10.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__console_error_panic_hook__0_1_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/console_error_panic_hook/console_error_panic_hook-0.1.6.crate",
        type = "tar.gz",
        strip_prefix = "console_error_panic_hook-0.1.6",
        build_file = Label("//rust/wasm/cargo/remote:console_error_panic_hook-0.1.6.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__lazy_static__1_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lazy_static/lazy_static-1.4.0.crate",
        type = "tar.gz",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//rust/wasm/cargo/remote:lazy_static-1.4.0.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__log__0_4_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/log/log-0.4.11.crate",
        type = "tar.gz",
        strip_prefix = "log-0.4.11",
        build_file = Label("//rust/wasm/cargo/remote:log-0.4.11.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__proc_macro2__0_4_30",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-0.4.30.crate",
        type = "tar.gz",
        strip_prefix = "proc-macro2-0.4.30",
        build_file = Label("//rust/wasm/cargo/remote:proc-macro2-0.4.30.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__quote__0_6_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-0.6.13.crate",
        type = "tar.gz",
        strip_prefix = "quote-0.6.13",
        build_file = Label("//rust/wasm/cargo/remote:quote-0.6.13.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__syn__0_15_44",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-0.15.44.crate",
        type = "tar.gz",
        strip_prefix = "syn-0.15.44",
        build_file = Label("//rust/wasm/cargo/remote:syn-0.15.44.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = Label("//rust/wasm/cargo/remote:unicode-xid-0.1.0.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen/wasm-bindgen-0.2.48.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-0.2.48",
        build_file = Label("//rust/wasm/cargo/remote:wasm-bindgen-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_backend__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-backend/wasm-bindgen-backend-0.2.48.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-backend-0.2.48",
        build_file = Label("//rust/wasm/cargo/remote:wasm-bindgen-backend-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_macro__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro/wasm-bindgen-macro-0.2.48.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-0.2.48",
        build_file = Label("//rust/wasm/cargo/remote:wasm-bindgen-macro-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_macro_support__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro-support/wasm-bindgen-macro-support-0.2.48.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-support-0.2.48",
        build_file = Label("//rust/wasm/cargo/remote:wasm-bindgen-macro-support-0.2.48.BUILD.bazel"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_shared__0_2_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-shared/wasm-bindgen-shared-0.2.48.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-shared-0.2.48",
        build_file = Label("//rust/wasm/cargo/remote:wasm-bindgen-shared-0.2.48.BUILD.bazel"),
    )

