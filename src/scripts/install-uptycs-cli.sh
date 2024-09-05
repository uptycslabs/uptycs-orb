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

curl -o "${DOWNLOAD_DIR}/uptycs-cli-${VERSION}.tar.gz" "${DOWNLOAD_URL}"
tar -xz "${DOWNLOAD_DIR}/uptycs-cli-${VERSION}.tar.gz" "${DOWNLOAD_DIR}/uptycs-cli-${VERSION}"
mv "${DOWNLOAD_DIR}/uptycs-cli-${VERSION}/bin/*" "${INSTALL_DIR}/"
