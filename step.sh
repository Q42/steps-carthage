#!/bin/bash

set -e

NO_USE_BINARIES=""

if [[ "${no_use_binaries}" == "true" ]] ; then
	NO_USE_BINARIES='--no-use-binaries'
fi

#
# Bootstrap
export CODE_SIGNING_REQUIRED=NO
export CODE_SIGNING_ALLOWED=NO
carthage "${carthage_command}" --platform iOS --verbose ${NO_USE_BINARIES}
