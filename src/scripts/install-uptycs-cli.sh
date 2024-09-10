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
BINARY_NAME="uptycs-cli-${VERSION}-linux-${ARCH}"

curl -o "${DOWNLOAD_DIR}/${BINARY_NAME}.tar.gz" "https://downloads.uptycs.io/uptycs-cli/${BINARY_NAME}.tar.gz"
tar -xz "${DOWNLOAD_DIR}/${BINARY_NAME}.tar.gz" "${DOWNLOAD_DIR}/${BINARY_NAME}"
mv "${DOWNLOAD_DIR}/${BINARY_NAME}/bin/*" "${INSTALL_DIR}/"
