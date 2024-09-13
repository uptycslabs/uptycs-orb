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
    uptycs: uptycs/uptycs@0.1.0
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
