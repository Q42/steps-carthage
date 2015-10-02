#!/bin/bash

set -e

NO_USE_BINARIES=""

if [[ "${no_use_binaries}" == "true" ]] ; then
	NO_USE_BINARIES='--no-use-binaries'
fi

#
# Bootstrap
#carthage "${carthage_command}" --platform iOS --verbose ${NO_USE_BINARIES}
carthage checkout --verbose
find Carthage -name *.pbxproj -exec sed -i bak 's/CODE_SIGN_IDENTITY = "iPhone Developer"/CODE_SIGN_IDENTITY = "iPhone Distribution"/' '{}' +
carthage build --platform iOS --verbose ${NO_USE_BINARIES}
