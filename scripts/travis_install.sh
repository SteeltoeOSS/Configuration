#!/bin/bash

dotnet --info

export CI_BUILD=True
export STEELTOE_VERSION=2.0.0
if [[ "$TRAVIS_BRANCH" == "master" ]]; then cp config/nuget-master.config ./nuget.config ; fi
if [[ "$TRAVIS_BRANCH" == "dev" ]]; then cp config/nuget-dev.config ./nuget.config ; fi
if [[ "$TRAVIS_BRANCH" == "vnext" ]]; then cp config/nuget-vnext.config ./nuget.config ; fi
if [[ "$TRAVIS_TAG" != "" ]]; then cp config/nuget.config ./nuget.config ; fi
if [[ "$TRAVIS_BRANCH" == "master" ]]; then cp config/versions.props ./versions.props ; fi
if [[ "$TRAVIS_BRANCH" == "dev" ]]; then cp config/versions.props ./versions.props ; fi
if [[ "$TRAVIS_BRANCH" == "vnext" ]]; then cp config/versions.props ./versions.props ; fi
if [[ "$TRAVIS_TAG" != "" ]]; then cp config/versions.props ./versions.props ; fi
