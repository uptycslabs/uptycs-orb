#!/usr/bin/env bash
function fail() {
    echo "${1}"
    exit 1
}

# Read the required parameters and ensure that they are properly defined.
CREDENTIALS=$(circleci env subst "${PARAM_CREDENTIALS}")
readonly CREDENTIALS
IMAGE=$(circleci env subst "${PARAM_IMAGE}")
readonly IMAGE

if [ -z ${CREDENTIALS+x} ]; then fail "credentials parameter must be set"; fi
if [ -z ${IMAGE+x} ]; then fail "image parameter must be set"; fi

uptycs_cli_args=("--credentials=${CREDENTIALS}" "--image=${IMAGE}")

# Read optional parameters.
# cache-dir
if [ -n "${PARAM_CACHE_DIR}" ]; then
    uptycs_cli_args+=("--cache-dir=${PARAM_CACHE_DIR}");
fi

# exit-on-error
if [ "${PARAM_EXIT_ON_ERROR}" = "true" ]; then
    uptycs_cli_args+=("--exit-on-error");
fi

# fatal-cvss-score
if [ "${PARAM_FATAL_CVSS_SCORE}" != "-1" ]; then
    uptycs_cli_args+=("--fatal-cvss-score=${PARAM_FATAL_CVSS_SCORE}");
fi

# fatal-vulnerability-seveirty
if [ "${PARAM_FATAL_VULNERABILITY_SEVERITY}" != "unset" ]; then
    uptycs_cli_args+=("--fatal-vulnerability-severity=${PARAM_FATAL_VULNERABILITY_SEVERITY}");
fi

# ignore-no-exploit
if [ "${PARAM_IGNORE_NO_EXPLOIT}" = "true" ]; then
    uptycs_cli_args+=("--ignore-no-exploit");
fi

# ignore-no-fix
if [ "${PARAM_IGNORE_NO_FIX}" = "true" ]; then
    uptycs_cli_args+=("--ignore-no-fix");
fi

# output-format
if [ -n "${PARAM_OUTPUT_FORMAT}" ]; then
    uptycs_cli_args+=("--output-format=${PARAM_OUTPUT_FORMAT}");
fi

# output-name
if [ -n "${PARAM_OUTPUT_NAME}" ]; then
    uptycs_cli_args+=("--output-name=${PARAM_OUTPUT_NAME}");
fi

# policy-name
if [ -n "${PARAM_POLICY_NAME}" ]; then
    uptycs_cli_args+=("--policy-name=${PARAM_POLICY_NAME}");
fi

# scanner-image
if [ -n "${PARAM_SCANNER_IMAGE}" ]; then
    uptycs_cli_args+=("--scanner-image=${PARAM_SCANNER_IMAGE}");
fi

# uptycs-ca-cert
if [ -n "${PARAM_UPTYCS_CA_CERT}" ]; then
    uptycs_cli_args+=("--uptycs-ca-cert=${PARAM_UPTYCS_CA_CERT}");
fi

# verbose
if [ "${PARAM_VERBOSE}" = "true" ]; then
    uptycs_cli_args+=("--verbose");
fi

# Now execute the scan, using the args that we built up above.
cd /tmp && uptycs-cli images scan "${uptycs_cli_args[@]}"
