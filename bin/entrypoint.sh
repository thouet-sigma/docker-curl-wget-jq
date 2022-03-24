#!/bin/bash

set -euo pipefail

# if nothing is passed, assume we want to run bash
if [[ "$#" == 0 ]]; then
  set -- /bin/bash
fi

# if first arg looks like a flag, assume we want to run bash with flags
if [[ "${1#-}" != "${1}" ]] || [[ -z "$(command -v "${1}")" ]]; then
  set -- /bin/bash "$@"
fi


exec "$@"