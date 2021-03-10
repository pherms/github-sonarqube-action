#!/bin/bash

set -e

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
	EVENT_ACTION=$(jq -r ".action" "${GITHUB_EVENT_PATH}")
	if [[ "${EVENT_ACTION}" != "opened" ]]; then
		echo "No need to run analysis. It is already triggered by the push event."
		exit
	fi
fi

sonar-scanner \
-Dsonar.host.url=${INPUT_HOST} \
-Dsonar.projectKey=${INPUT_PROJECTKEY} \
-Dsonar.projectName=${INPUT_PROJECTNAME} \
-Dsonar.login=${INPUT_LOGIN} \
-Dsonar.password=${INPUT_PASSWORD} \