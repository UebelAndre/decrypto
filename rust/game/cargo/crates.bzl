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

def decrypto_game_fetch_remote_crates():
    
    _new_http_archive(
        name = "decrypto_game__cfg_if__0_1_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.10.crate",
        type = "tar.gz",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//rust/game/cargo/remote:cfg-if-0.1.10.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__getrandom__0_1_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/getrandom/getrandom-0.1.14.crate",
        type = "tar.gz",
        strip_prefix = "getrandom-0.1.14",
        build_file = Label("//rust/game/cargo/remote:getrandom-0.1.14.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__libc__0_2_76",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libc/libc-0.2.76.crate",
        type = "tar.gz",
        strip_prefix = "libc-0.2.76",
        build_file = Label("//rust/game/cargo/remote:libc-0.2.76.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__ppv_lite86__0_2_9",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ppv-lite86/ppv-lite86-0.2.9.crate",
        type = "tar.gz",
        strip_prefix = "ppv-lite86-0.2.9",
        build_file = Label("//rust/game/cargo/remote:ppv-lite86-0.2.9.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__rand__0_7_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand/rand-0.7.3.crate",
        type = "tar.gz",
        strip_prefix = "rand-0.7.3",
        build_file = Label("//rust/game/cargo/remote:rand-0.7.3.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__rand_chacha__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_chacha/rand_chacha-0.2.2.crate",
        type = "tar.gz",
        strip_prefix = "rand_chacha-0.2.2",
        build_file = Label("//rust/game/cargo/remote:rand_chacha-0.2.2.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__rand_core__0_5_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_core/rand_core-0.5.1.crate",
        type = "tar.gz",
        strip_prefix = "rand_core-0.5.1",
        build_file = Label("//rust/game/cargo/remote:rand_core-0.5.1.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__rand_hc__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_hc/rand_hc-0.2.0.crate",
        type = "tar.gz",
        strip_prefix = "rand_hc-0.2.0",
        build_file = Label("//rust/game/cargo/remote:rand_hc-0.2.0.BUILD.bazel"),
    )
    
    _new_http_archive(
        name = "decrypto_game__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasi/wasi-0.9.0+wasi-snapshot-preview1.crate",
        type = "tar.gz",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//rust/game/cargo/remote:wasi-0.9.0+wasi-snapshot-preview1.BUILD.bazel"),
    )
    