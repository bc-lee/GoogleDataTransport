load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _promises_deps_impl(mctx):
    http_archive(
        name = "promises",
        urls = ["https://github.com/bc-lee/promises/archive/b31b19c8825bac4a339aa39ff11444a9c660ab1e.tar.gz"],
        strip_prefix = "promises-b31b19c8825bac4a339aa39ff11444a9c660ab1e",
        patches = [
            "@google_data_transport//third_party/promises:0001-rename.patch",
        ],
        patch_args = [
            "-p1",
        ],
    )

promises_deps = module_extension(
    implementation = _promises_deps_impl,
)

def _nanopb_deps_impl(mctx):
    http_archive(
        name = "nanopb",
        urls = ["https://github.com/firebase/nanopb/archive/refs/tags/2.30910.0.tar.gz"],
        sha256 = "1ac3b9ba9f03148a2f0e70d30507d5ac620554a4faf0dc2603cf75fa491da4f7",
        strip_prefix = "nanopb-2.30910.0",
        patches = [
            "@google_data_transport//third_party/nanopb:0001-nanopb-defines.patch",
        ],
        patch_args = [
            "-p1",
        ],
    )

nanopb_deps = module_extension(
    implementation = _nanopb_deps_impl,
)
