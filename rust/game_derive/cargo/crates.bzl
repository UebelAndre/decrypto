"""
@generated
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def decrypto_game_derive_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "decrypto_game_derive__proc_macro2__1_0_20",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-1.0.20.crate",
        type = "tar.gz",
        strip_prefix = "proc-macro2-1.0.20",
        build_file = Label("//rust/game_derive/cargo/remote:proc-macro2-1.0.20.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "decrypto_game_derive__quote__1_0_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-1.0.7.crate",
        type = "tar.gz",
        strip_prefix = "quote-1.0.7",
        build_file = Label("//rust/game_derive/cargo/remote:quote-1.0.7.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "decrypto_game_derive__syn__1_0_40",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-1.0.40.crate",
        type = "tar.gz",
        strip_prefix = "syn-1.0.40",
        build_file = Label("//rust/game_derive/cargo/remote:syn-1.0.40.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "decrypto_game_derive__unicode_xid__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.2.1.crate",
        type = "tar.gz",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//rust/game_derive/cargo/remote:unicode-xid-0.2.1.BUILD.bazel"),
    )
