#!/usr/bin/env bash
# Determine the version of the cli to be installed.
VERSION=$(circleci env subst "${PARAM_VERSION}")
readonly VERSION

# Determine where we're installing the binary.
INSTALL_DIR=$(circleci env subst "${PARAM_INSTALL_DIR}")
readonly INSTALL_DIR

echo "installing uptycs-cli@${VERSION} to ${INSTALL_DIR}/uptycs-cli"

# Get the latest binary and install it.
DOWNLOAD_DIR=$(mktemp -d)
ARCH=$(uname -m)

if [ "${ARCH}" = "aarch64" ]; then
    ARCH="arm64";
elif [ "${ARCH}" = "x86_64" ]; then
    ARCH="amd64";
fi

BINARY_NAME="uptycs-cli-${VERSION}-linux-${ARCH}"

echo "downloading https://downloads.uptycs.io/uptycs-cli/${BINARY_NAME}.tar.gz"

curl -o "${DOWNLOAD_DIR}/${BINARY_NAME}.tar.gz" "https://downloads.uptycs.io/uptycs-cli/${BINARY_NAME}.tar.gz"
tar -xf "${DOWNLOAD_DIR}/${BINARY_NAME}.tar.gz" --directory "${DOWNLOAD_DIR}/"
mkdir -p "${INSTALL_DIR}"
mv "${DOWNLOAD_DIR}/bin/uptycs-cli" "${INSTALL_DIR}/uptycs-cli"
chmod +x "${INSTALL_DIR}/uptycs-cli"
