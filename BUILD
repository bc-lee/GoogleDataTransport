load("@rules_swift//swift:swift.bzl", "swift_test")
load("@rules_cc//cc:defs.bzl", "objc_library")

package(default_visibility = ["//visibility:public"])

objc_library(
    name = "GoogleDataTransport",
    srcs = glob([
        "GoogleDataTransport/GDTCCTLibrary/**/*.m",
        "GoogleDataTransport/GDTCCTLibrary/Private/**/*.h",
        "GoogleDataTransport/GDTCCTLibrary/Protogen/**/*.h",
        "GoogleDataTransport/GDTCCTLibrary/Protogen/**/*.c",
        "GoogleDataTransport/GDTCORLibrary/**/*.m",
        "GoogleDataTransport/GDTCORLibrary/Private/**/*.h",
        "GoogleDataTransport/GDTCORLibrary/Internal/**/*.h",
    ]),
    hdrs = glob([
        "GoogleDataTransport/GDTCCTLibrary/Public/**/*.h",
        "GoogleDataTransport/GDTCORLibrary/Public/**/*.h",
    ]),
    defines = [
        "GDTCOR_VERSION=0.0.1",
        "PB_FIELD_32BIT=1",
        "PB_NO_PACKED_STRUCTS=1",
        "PB_ENABLE_MALLOC=1",
    ],
    enable_modules = True,
    module_name = "GoogleDataTransport",
    sdk_dylibs = ["z"],
    sdk_frameworks = [
        "CoreTelephony",
        "SystemConfiguration",
    ],
    deps = [
        "@nanopb",
        "@promises//:FBLPromises",
    ],
)

swift_test(
    name = "GoogleDataTransportSwiftTests",
    srcs = ["SwiftPMTests/swift-test/main.swift"],
    deps = [
        ":GoogleDataTransport",
    ],
)

# objc-import-test is omitted from bazel build because it currently fails to build.
# See https://github.com/bazelbuild/rules_apple/issues/2690 for details.
