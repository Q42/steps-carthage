#!/bin/bash

set -e

NO_USE_BINARIES=""

if [[ "${no_use_binaries}" == "true" ]] ; then
	NO_USE_BINARIES='--no-use-binaries'
fi

#
# First checkout all repos

carthage checkout --verbose

#
# Set the code sign identities of all Carthage repos to "iPhone Distribution"

find Carthage -name *.pbxproj -exec sed -i .bak 's/CODE_SIGN_IDENTITY = "-"/CODE_SIGN_IDENTITY = "iPhone Distribution"/' '{}' +
find Carthage -name *.pbxproj -exec sed -i .bak 's/CODE_SIGN_IDENTITY = "iPhone Developer"/CODE_SIGN_IDENTITY = "iPhone Distribution"/' '{}' +
find Carthage -name *.pbxproj -exec sed -i .bak 's/"CODE_SIGN_IDENTITY\[sdk=iphoneos\*\]" = "iPhone Developer"/CODE_SIGN_IDENTITY = "iPhone Distribution"/' '{}' +

#
# Build all repos

carthage build --platform iOS --verbose ${NO_USE_BINARIES}
