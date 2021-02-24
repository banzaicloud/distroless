#!/bin/sh
set -o errexit
set -o xtrace

bazel build --host_force_python=PY2 //package_manager:dpkg_parser.par

# Optional: trigger building package bundles without concurrency to avoid
# flakiness: https://github.com/GoogleContainerTools/distroless/issues/646
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_amd64_debian9//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_amd64_debian10//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_arm_debian9//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_arm_debian10//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_arm64_debian9//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_arm64_debian10//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_s390x_debian9//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_s390x_debian10//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_ppc64le_debian9//file:packages.bzl
bazel build --jobs=1 --host_force_python=PY2 @package_bundle_ppc64le_debian10//file:packages.bzl
