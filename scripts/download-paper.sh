#!/usr/bin/env bash
set -euo pipefail

MC_VERSION="${MC_VERSION:-26.2}"
USER_AGENT="MatiX-SMP-Codespaces (https://github.com/MxrGH/-)"
API_URL="https://fill.papermc.io/v3/projects/paper/versions/${MC_VERSION}/builds"

command -v curl >/dev/null || { echo "curl is required."; exit 1; }
command -v jq >/dev/null || { echo "jq is required. Rebuild the Codespace or install jq."; exit 1; }

echo "Checking Paper ${MC_VERSION} stable builds..."
response="$(curl -fsS -H "User-Agent: ${USER_AGENT}" "${API_URL}")"
download_url="$(printf '%s' "${response}" | jq -r 'first(.[] | select(.channel == "STABLE") | .downloads["server:default"].url) // empty')"

if [[ -z "${download_url}" ]]; then
  echo "No stable Paper build was found for Minecraft ${MC_VERSION}."
  echo "Check the version or Paper's downloads page."
  exit 1
fi

echo "Downloading Paper for Minecraft ${MC_VERSION}..."
curl -fL --retry 3 "${download_url}" -o server.jar
echo "Saved server.jar"
