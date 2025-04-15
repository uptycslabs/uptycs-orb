# uptycs-orb

<!---
[![CircleCI Build Status](https://circleci.com/gh/uptycs/uptycs-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/uptycs/uptycs-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/uptycs/uptycs-orb.svg)](https://circleci.com/developer/orbs/orb/uptycs/uptycs-orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/<organization>/<project-name>/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

--->

A Circle CI Orb which provides Uptycs docker image scanning capabilities.
---

## Examples

Build an image and scan it, using the default policy.

```yaml
description: >
  Build a docker image and scan it.
usage:
  version: 2.1
  orbs:
    uptycs: uptycs/uptycs@0.1.7
  workflows:
    build-and-scan:
      jobs:
        - build:
          steps:
            - run: docker build -t myimage:latest .
        - uptycs/image-scan:
          context:
            - uptycs-credentials
          image: myimage:latest
          credentials: $UPTYCS_CREDENTIALS

```

## Options

The following sections define the available options for the uptycs orb.

### uptycs/install_uptycs_cli Command

| Name          | Type    | Default            | Description                                                              |
|---------------|---------|--------------------|--------------------------------------------------------------------------|
| `version`     | String  |                    | Version of uptycs-cli to install, defaults to the latest stable release. |
| `install_dir` | String  | /usr/local/bin     | The directory to install the uptycs-cli binary into.                     |

### uptycs/uptycs_cli_image_scan Command

| Name                           | Type    | Default | Description                                                                           |
|--------------------------------|---------|---------|---------------------------------------------------------------------------------------|
| `credentials`                  | String  |         | JSON formatted credentials used to authenticate to Uptycs.                            |
| `image`                        | String  |         | The docker image to scan.                                                             |
| `cache_dir`                    | String  |         | A local directory in which to cache threat indicators.                                |
| `exit_on_error`                | Boolean | true    | When true, return a non-zero exit code in the result of a scan failure.               |
| `fata_cvss_score`              | Float   | -1      | Maximum allowable CVSS score for a detected vulnerability.                            |
| `fatal_vulnerability_severity` | String  |         | Maximum allowable severity for a detected vulnerability.                              |
| `ignore_no_exploit`            | Boolean |         | Ignore any vulnerabilities for which no known exploits are available.                 |
| `ignore_no_fix`                | Boolean |         | Ignore any vulnerabilities for which no fixes are available.                          |
| `output_format`                | String  |         | The format type to use when writing reports to disk. Either 'json' or 'csv'.          |
| `output_name`                  | String  |         | A unique ID that can be used to organize output files from multiple scans. Defaults to the id of the scanned image. |
| `policy_name`                  | String  |         | The name of an image assurance policy to evaluate the image against.                  |
| `scanner_image`                | String  |         | A specific uptycs-ci image to use. By default the latest stable image will be used.   |
| `uptycs_ca_cert`               | String  |         | Path to a custom root CA Certificate for connecting to uptycs.                        |
| `verbose`                      | String  |         | Include verbose output.                                                               |


### uptycs/image_scan Job

| Name                           | Type    | Default        | Description                                                                           |
|--------------------------------|---------|----------------|---------------------------------------------------------------------------------------|
| `version`                      | String  |                | Version of uptycs-cli to install, defaults to the latest stable release.              |
| `install_dir`                  | String  | /usr/local/bin | The directory to install the uptycs-cli binary into.                                  |
| `credentials`                  | String  |                | JSON formatted credentials used to authenticate to Uptycs.                            |
| `image`                        | String  |                | The docker image to scan.                                                             |
| `cache_dir`                    | String  |                | A local directory in which to cache threat indicators.                                |
| `exit_on_error`                | Boolean | true           | When true, return a non-zero exit code in the result of a scan failure.               |
| `fata_cvss_score`              | Float   | -1             | Maximum allowable CVSS score for a detected vulnerability.                            |
| `fatal_vulnerability_severity` | String  |                | Maximum allowable severity for a detected vulnerability.                              |
| `ignore_no_exploit`            | Boolean |                | Ignore any vulnerabilities for which no known exploits are available.                 |
| `ignore_no_fix`                | Boolean |                | Ignore any vulnerabilities for which no fixes are available.                          |
| `output_format`                | String  |                | The format type to use when writing reports to disk. Either 'json' or 'csv'.          |
| `output_name`                  | String  |                | A unique ID that can be used to organize output files from multiple scans. Defaults to the id of the scanned image. |
| `policy_name`                  | String  |                | The name of an image assurance policy to evaluate the image against.                  |
| `scanner_image`                | String  |                | A specific uptycs-ci image to use. By default the latest stable image will be used.   |
| `uptycs_ca_cert`               | String  |                | Path to a custom root CA Certificate for connecting to uptycs.                        |
| `verbose`                      | String  |                | Include verbose output.                                                               |
