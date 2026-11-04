#!/usr/bin/env bash
set -euo pipefail

version="${IPERF_VERSION:-3.22}"
repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
build_root="${BUILD_ROOT:-${repo_root}/.build}"
output_root="${OUTPUT_DIR:-${repo_root}/dist}"

mkdir -p "${build_root}" "${output_root}"
work_dir="$(mktemp -d "${build_root}/iperf.XXXXXXXX")"
trap 'rm -rf "${work_dir}"' EXIT

source_dir="${work_dir}/iperf"
package_dir="${output_root}/iperf-${version}-win64"

git clone --depth 1 --branch "${version}" https://github.com/esnet/iperf.git "${source_dir}"
upstream_commit="$(git -C "${source_dir}" rev-parse HEAD)"

cd "${source_dir}"
./configure --without-openssl
make -j "$(nproc)"
make check

binary="${source_dir}/src/.libs/iperf3.exe"
if [[ ! -f "${binary}" ]]; then
    printf 'Linked binary was not found at %s\n' "${binary}" >&2
    exit 1
fi

rm -rf "${package_dir}"
mkdir -p "${package_dir}"
printf '%s\n' "Packaging linked binary and Cygwin runtime..."
cp "${binary}" /bin/cygwin1.dll LICENSE "${package_dir}/"
printf '%s\n' "Stripping packaged executable..."
strip --strip-unneeded "${package_dir}/iperf3.exe"

printf '%s\n' "Recording version and runtime dependencies..."
if ! "${binary}" --version > "${package_dir}/version.txt"; then
    printf 'Linked executable failed its version probe: %s\n' "${binary}" >&2
    exit 1
fi
if ! cygcheck "${binary}" > "${package_dir}/dependencies.txt"; then
    printf '%s\n' "Warning: cygcheck could not record runtime dependencies." >&2
fi
if ! cygcheck -c > "${package_dir}/cygwin-packages.txt"; then
    printf '%s\n' "Warning: cygcheck reported an incomplete package inventory." >&2
fi

cat > "${package_dir}/build-metadata.txt" <<EOF
iperf_version=${version}
iperf_upstream=https://github.com/esnet/iperf
iperf_commit=${upstream_commit}
configure_flags=--without-openssl
EOF

printf '%s\n' "Built ${package_dir} from ESnet/iperf commit ${upstream_commit}"
